<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Ramom school management system
 * @version : 4.0
 * @developed by : RamomCoder
 * @support : ramomcoder@yahoo.com
 * @author url : http://codecanyon.net/user/RamomCoder
 * @filename : Attachments.php
 * @copyright : Reserved RamomCoder Team
 */

class Attachments extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->helpers('download');
        $this->load->model('attachments_model');
    }

    public function index()
    {
        // check access permission
        if (!get_permission('attachments', 'is_view')) {
            access_denied();
        }

        $this->data['branch_id'] = $this->application_model->get_branch_id();
        $this->data['attachmentss'] = $this->attachments_model->getAttachmentsList();
        $this->data['title'] = translate('upload_content');
        $this->data['sub_page'] = 'attachments/index';
        $this->data['main_menu'] = 'attachments';
        $this->data['headerelements'] = array(
            'css' => array(
                'vendor/dropify/css/dropify.min.css',
            ),
            'js' => array(
                'vendor/dropify/js/dropify.min.js',
            ),
        );
        $this->load->view('layout/index', $this->data);
    }

    // attachments information edit here
    public function edit($id = '')
    {
        // check access permission
        if (!get_permission('attachments', 'is_edit')) {
            access_denied();
        }

        $attachments_db = $this->db->where('id', $id)->get('attachments')->row_array();
        if ($attachments_db['uploader_id'] != get_loggedin_user_id()) {
            set_alert('error', 'You do not have permission to edit');
            redirect(base_url('attachments'));
        }

        $this->data['branch_id'] = $this->application_model->get_branch_id();
        $this->data['data'] = $this->db->where('id', $id)->get('attachments')->row_array();
        $this->data['title'] = translate('upload_content');
        $this->data['sub_page'] = 'attachments/edit';
        $this->data['main_menu'] = 'attachments';
        $this->data['headerelements'] = array(
            'css' => array(
                'vendor/dropify/css/dropify.min.css',
            ),
            'js' => array(
                'vendor/dropify/js/dropify.min.js',
            ),
        );
        $this->load->view('layout/index', $this->data);
    }

    public function save()
    {
        if ($_POST) {
            if (isset($_POST['attachment_id'])) {
                if (!get_permission('attachments', 'is_edit')) {
                    ajax_access_denied();
                }
            } else {
                if (!get_permission('attachments', 'is_add')) {
                    ajax_access_denied();
                }
            }
            $this->form_validation->set_rules('title', translate('title'), 'trim|required');
            $this->form_validation->set_rules('date', translate('date'), 'trim|required');
            $this->form_validation->set_rules('section_id', translate('class'), 'trim|required');
            if ($this->form_validation->run() !== false) {
                $post = $this->input->post();
                $response = $this->attachments_model->save($post);
                if (is_array($response)) {
                    set_alert('error', $response['error']);
                } else {
                    if ($response) {
                        set_alert('success', translate('information_has_been_saved_successfully'));
                    }
                }
                $url = base_url('attachments');
                $array = array('status' => 'success', 'url' => $url);
            } else {
                $error = $this->form_validation->error_array();
                $array = array('status' => 'fail', 'url' => '', 'error' => $error);
            }
            echo json_encode($array);
        }
    }

    public function delete($id)
    {
        if (get_permission('attachments', 'is_delete')) {
            $enc_name = $this->db->select('enc_name')->where('id', $id)->get('attachments')->row()->enc_name;
            $file_name = 'uploads/attachments/' . $enc_name;
            if (!is_superadmin_loggedin()) {
                $this->db->where('branch_id', get_loggedin_branch_id());
                $this->db->where('uploader_id', get_loggedin_user_id());
            }
            $this->db->where('id', $id);
            $this->db->delete('attachments');
            if ($this->db->affected_rows() > 0) {
                if (file_exists($file_name)) {
                    unlink($file_name);
                }
            }
        }
    }

    // file downloader
    public function download()
    {
        $encrypt_name = $this->input->get('file');
        $file_name = $this->db->select('file_name')->where('enc_name', $encrypt_name)->get('attachments')->row()->file_name;
        $this->load->helper('download');
        force_download($file_name, file_get_contents('uploads/attachments/' . $encrypt_name));
    }

    public function playVideo()
    {
        // check access permission
        if (!get_permission('attachments', 'is_view')) {
            access_denied();
        }

        $id = $this->input->post('id');
        $file = get_type_name_by_id('attachments', $id, 'enc_name');
        echo '<video width="560" controls id="attachment_video">';
        echo '<source src="' . base_url('uploads/attachments/' . $file) . '" type="video/mp4">';
        echo 'Your browser does not support HTML video.';
        echo '</video>';
    }

    public function handle_upload()
    {
        if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
            $file_size = $_FILES["attachment_file"]["size"];
            $file_name = $_FILES["attachment_file"]["name"];
            $allowedExts = array('pdf', 'doc', 'xls', 'docx', 'xlsx', 'txt', 'jpg', 'jpeg', 'png', 'gif', 'bmp', 'mp4');
            $extension = pathinfo($file_name, PATHINFO_EXTENSION);
            if ($files = filesize($_FILES['attachment_file']['tmp_name'])) {
                if (!in_array(strtolower($extension), $allowedExts)) {
                    $this->form_validation->set_message('handle_upload', translate('this_file_type_is_not_allowed'));
                    return false;
                }
            } else {
                $this->form_validation->set_message('handle_upload', translate('error_reading_the_file'));
                return false;
            }
            return true;
        } else {
            if (isset($_POST['attachment_id'])) {
                return true;
            }
            $this->form_validation->set_message('handle_upload', "The Attachment field is required.");
            return false;
        }
    }
}
