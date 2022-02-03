<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Attachments_model extends MY_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function save($data)
    {
        $classID = $data['section_id'];
        $arrayData = array(
            'branch_id' => 1,
            'title' => $data['title'],
            'remarks' => $data['remarks'],
            'date' => date("Y-m-d", strtotime($data['date'])),
            'session_id' => get_session_id(),
            'uploader_id' => get_loggedin_user_id(),
            'class_id' => $classID,
            'updated_at' => date("Y-m-d H:i:s"),
        );

        if (!isset($data['attachment_id'])) {
            // uploading file using codeigniter upload library
            $config['upload_path'] = 'uploads/attachments/';
            $config['encrypt_name'] = true;
            $config['allowed_types'] = '*';
            $this->upload->initialize($config);
            if ($this->upload->do_upload("attachment_file")) {
                $arrayData['file_name'] = $this->upload->data('orig_name');
                $arrayData['enc_name'] = $this->upload->data('file_name');
                $this->db->insert('attachments', $arrayData);
            } else {
                return ['error' => $this->upload->display_errors()];
            }
        } else {
            if ($_FILES['attachment_file']['name'] != "") {
                $config['upload_path'] = 'uploads/attachments/';
                $config['encrypt_name'] = true;
                $config['allowed_types'] = '*';
                $this->upload->initialize($config);
                if ($this->upload->do_upload("attachment_file")) {
                    $encrypt_name = $this->db->select('enc_name')->where('id', $data['attachment_id'])->get('attachments')->row()->enc_name;
                    $file_name = 'uploads/attachments/' . $encrypt_name;
                    if (file_exists($file_name)) {
                        unlink($file_name);
                    }
                    $arrayData['file_name'] = $this->upload->data('orig_name');
                    $arrayData['enc_name'] = $this->upload->data('file_name');
                    $this->db->where('id', $data['attachment_id']);
                    $this->db->update('attachments', $arrayData);
                } else {
                    return ['error' => $this->upload->display_errors()];
                }
            } else {
                if (!is_superadmin_loggedin()) {
                    $this->db->where('branch_id', get_loggedin_branch_id());
                }
                $this->db->where('id', $data['attachment_id']);
                $this->db->update('attachments', $arrayData);
            }
        }
        if ($this->db->affected_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    // get attachments list
    public function getAttachmentsList()
    {
        $this->db->select('a.*,b.name as branch_name,c.name as class_name');
        $this->db->from('attachments as a');
        $this->db->join('section as c', 'c.id = a.class_id', 'left');
        $this->db->join('branch as b', 'b.id = a.branch_id', 'left');
        if (!is_superadmin_loggedin()) {
            $this->db->where('a.branch_id', get_loggedin_branch_id());
        }
        if (loggedin_role_id() == 6) {
            $classID = $this->db->select('class_id')->where('student_id', get_activeChildren_id())->get('enroll')->row()->class_id;
            $this->db->where('class_id', $classID)->or_where('class_id', 'unfiltered');
        }
        if (loggedin_role_id() == 7) {
            $classID = $this->db->select('class_id')->where('student_id', get_loggedin_user_id())->get('enroll')->row()->class_id;
            $this->db->where('class_id', $classID)->or_where('class_id', 'unfiltered');
        }
        $this->db->order_by('a.id', 'desc');
        $result = $this->db->get()->result_array();
        return $result;
    }
}
