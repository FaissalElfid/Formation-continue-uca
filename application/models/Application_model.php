<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Application_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function get_branch_id()
    {
        return 1;// this is the uca branch
    }

    public function profilePicUpload()
    {
        if (isset($_FILES["user_photo"]) && !empty($_FILES['user_photo']['name'])) {
            $file_size = $_FILES["user_photo"]["size"];
            $file_name = $_FILES["user_photo"]["name"];
            $allowedExts = array('jpg', 'jpeg', 'png');
            $extension = pathinfo($file_name, PATHINFO_EXTENSION);
            if ($files = filesize($_FILES['user_photo']['tmp_name'])) {
                if (!in_array(strtolower($extension), $allowedExts)) {
                    $this->form_validation->set_message('handle_upload', translate('this_file_type_is_not_allowed'));
                    return false;
                }
                if ($file_size > 2097152) {
                    $this->form_validation->set_message('handle_upload', translate('file_size_shoud_be_less_than') . " 2048KB.");
                    return false;
                }
            } else {
                $this->form_validation->set_message('handle_upload', translate('error_reading_the_file'));
                return false;
            }
            return true;
        }
    }

    public function getUserNameByRoleID($roleID, $userID = '')
    {
        if ($roleID == 6) {
            $sql = "SELECT name,email,photo,branch_id FROM parent WHERE id = " . $this->db->escape($userID);
            return $this->db->query($sql)->row_array();
        } elseif ($roleID == 7) {
            $sql = "SELECT student.id, CONCAT(student.first_name,' ',student.last_name) as name, student.email, student.photo, enroll.branch_id FROM student INNER JOIN enroll ON enroll.student_id = student.id WHERE student.id = " . $this->db->escape($userID);
            return $this->db->query($sql)->row_array();
        } else {
            $sql = "SELECT name,email,photo,branch_id FROM staff WHERE id = " . $this->db->escape($userID);
            return $this->db->query($sql)->row_array();
        }
    }

    public function getStudentListByClassSection($classID = '', $sectionID = '', $branchID = '', $deactivate = false, $rollOrder = false)
    {
        $sql = "SELECT e.*, s.photo, CONCAT(s.first_name, ' ', s.last_name) as fullname, s.register_no, s.parent_id, s.email, s.mobileno, s.blood_group, s.birthday, s.admission_date, l.active, c.name as class_name, se.name as section_name, sc.name as category FROM enroll as e INNER JOIN student as s ON e.student_id = s.id INNER JOIN login_credential as l ON l.user_id = s.id and l.role = 7 LEFT JOIN class as c ON e.class_id = c.id LEFT JOIN section as se ON e.section_id=se.id LEFT JOIN student_category as sc ON sc.id=s.category_id WHERE e.class_id = " . $this->db->escape($classID) . " AND e.branch_id = " . $this->db->escape($branchID) . " AND e.session_id = " . $this->db->escape(get_session_id());
        if ($sectionID != 'all') {
            $sql .= " AND e.section_id = " . $this->db->escape($sectionID);
        }
        if ($deactivate == true) {
            $sql .= " AND l.active = 0";
        }
        if ($rollOrder == true) {
            $sql .= " ORDER BY s.register_no ASC";
        } else {
            $sql .= " ORDER BY s.id ASC";
        }
        return $this->db->query($sql)->result_array();
    }

    public function getStudentDetails($id)
    {
        $this->db->select('s.*,e.class_id,e.section_id,e.id as enrollid,e.roll,e.branch_id,e.session_id,c.name as class_name,se.name as section_name,sc.name as category_name');
        $this->db->from('enroll as e');
        $this->db->join('student as s', 'e.student_id = s.id', 'left');
        $this->db->join('class as c', 'e.class_id = c.id', 'left');
        $this->db->join('section as se', 'e.section_id = se.id', 'left');
        $this->db->join('student_category as sc', 's.category_id=sc.id', 'left');
        $this->db->where('s.id', $id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function getLangImage($id = '', $thumb = true)
    {
        $file_path = 'uploads/language_flags/flag_' . $id . '_thumb.png';
        if (file_exists($file_path)) {
            if ($thumb == true) {
                $image_url = base_url($file_path);
            } else {
                $image_url = base_url('uploads/language_flags/flag_' . $id . '.png');
            }
        } else {
            if ($thumb == true) {
                $image_url = base_url('uploads/language_flags/defualt_thumb.png');
            } else {
                $image_url = base_url('uploads/language_flags/defualt.png');
            }
        }
        return $image_url;
    }

    // private unread message counter
    public function count_unread_message()
    {
        $active_user = loggedin_role_id() . '-' . get_loggedin_user_id();
        $query = $this->db->select('id')->where(array(
            'reciever' => $active_user,
            'read_status' => 0,
            'trash_inbox' => 0,
        ))->get('message');
        return $query->num_rows();
    }

    // reply unread message counter
    public function reply_count_unread_message()
    {
        $activeUser = loggedin_role_id() . '-' . get_loggedin_user_id();
        $query = $this->db->select('id')->where(array(
            'sender' => $activeUser,
            'reply_status' => 1,
            'trash_sent' => 0,
        ))->get('message');
        return $query->num_rows();
    }

    // unread message alert in topbar
    public function unread_message_alert()
    {
        $activeUser = loggedin_role_id() . '-' . get_loggedin_user_id();
        $activeUser = $this->db->escape($activeUser);
        $sql = "SELECT id,body,created_at,IF(sender = " . $activeUser . ", 'sent','inbox') as `msg_type`,IF(sender = " . $activeUser . ", reciever,sender) as `get_user` FROM message WHERE (sender = " . $activeUser . " AND trash_sent = 0 AND reply_status = 1) OR (reciever = " . $activeUser . " AND trash_inbox = 0 AND read_status = 0) ORDER BY id DESC";
        $result = $this->db->query($sql)->result_array();
        foreach ($result as $key => $value) {
           $result[$key]['message_details'] =  $this->getMessage_details($value['get_user']);
        }
        return $result;
    }

    public function getMessage_details($user_id)
    {
        $getUser = explode('-', $user_id);
        $userRoleID = $getUser[0];
        $userID = $getUser[1];
        $userType = '';
        if ($userRoleID == 6) {
            $userType = 'parent';
            $getUSER = $this->db->query("SELECT name,photo FROM parent WHERE id = " . $this->db->escape($userID))->row_array();
        } elseif ($userRoleID == 7) {
            $userType = 'student';
            $getUSER = $this->db->query("SELECT CONCAT(first_name, ' ', last_name) as name,photo FROM  student WHERE id = " . $this->db->escape($userID))->row_array();
        } else {
            $userType = 'staff';
            $getUSER = $this->db->query("SELECT name,photo FROM staff WHERE id = " . $this->db->escape($userID))->row_array();
        }
        $arrayData = array(
            'imgPath' => get_image_url($userType, $getUSER['photo']),
            'userName' => $getUSER['name'],
        );
        return $arrayData;
    }

    public function getBranchImage($id = '', $type = 'logo')
    {
        $file_path = 'uploads/app_image/' . $type . '-' . $id . '.png';
        if (file_exists($file_path) && !empty($id)) {
            $image_url = base_url($file_path);
        } else {
            $image_url = base_url("uploads/app_image/$type.png");
        }
        return $image_url;
    }
}
