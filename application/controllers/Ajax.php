<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Ramom school management system
 * @version : 4.0
 * @developed by : Faissal EL FID
 * @support : faissal.elfid@gmail.com
 * @copyright : Reserved for an IRISI Student
 * @filename : Ajax.php
 */

class Ajax extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('ajax_model');
    }

    // get class assign modal
    public function getClassAssignM()
    {
        $classID = $this->input->post('class_id');
        $sectionID = $this->input->post('section_id');
        $branchID = get_type_name_by_id('class', $classID, 'branch_id');
        $html = "";
        $subjects = $this->db->get_where('subject', array('branch_id' => $branchID))->result_array();
        if (count($subjects)) {
            foreach ($subjects as $row) {
                $query_assign = $this->db->get_where("subject_assign", array(
                    'class_id' => $classID,
                    'section_id' => $sectionID,
                    'session_id' => get_session_id(),
                    'subject_id' => $row['id'],
                ));
                $html .= '<option value="' . $row['id'] . '"' . ($query_assign->num_rows() != 0 ? 'selected' : '') . '>' . $row['name'] . '</option>';
            }
        }
        $data['branch_id'] = $branchID;
        $data['class_id'] = $classID;
        $data['section_id'] = $sectionID;
        $data['subject'] = $html;
        echo json_encode($data);
    }

    public function getDataByBranch()
    {
        $html = "";
        $table = $this->input->post('table');
        $branch_id = $this->application_model->get_branch_id();
        if (!empty($branch_id)) {
            $result = $this->db->select('id,name')->where('branch_id', $branch_id)->get($table)->result_array();
            if (count($result)) {
                $html .= "<option value=''>" . translate('select') . "</option>";
                foreach ($result as $row) {
                    $html .= '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                }
            } else {
                $html .= '<option value="">' . translate('no_information_available') . '</option>';
            }
        } else {
            $html .= '<option value="">' . translate('select_branch_first') . '</option>';
        }
        echo $html;
    }

    public function getClassByBranch()
    {
        $html = "";
        $branch_id = $this->application_model->get_branch_id();
        if (!empty($branch_id)) {
            $classes = $this->db->select('id,name')->where('branch_id', $branch_id)->get('class')->result_array();
            if (count($classes)) {
                $html .= "<option value=''>" . translate('select') . "</option>";
                foreach ($classes as $row) {
                    $html .= '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                }
            } else {
                $html .= '<option value="">' . translate('no_information_available') . '</option>';
            }
        } else {
            $html .= '<option value="">' . translate('select_branch_first') . '</option>';
        }
        echo $html;
    }

    // get section list based on the class
    public function getSectionByClass()
    {
        $html = "";
        $classID = $this->input->post("class_id");
        $mode = $this->input->post("all");
        $multi = $this->input->post("multi");
        if (!empty($classID)) {
            $getClassTeacher = $this->app_lib->getClassTeacher($classID);
            if (is_array($getClassTeacher)) {
                $result = $getClassTeacher;
                if (count($result) == 0) {
                    $this->db->select('timetable_class.section_id,section.name as section_name');
                    $this->db->from('timetable_class');
                    $this->db->join('section', 'section.id = timetable_class.section_id', 'left');
                    $this->db->where(array('timetable_class.teacher_id' => get_loggedin_user_id(), 'timetable_class.session_id' => get_session_id(), 'timetable_class.class_id' => $classID));
                    $this->db->group_by('timetable_class.section_id');
                    $result = $this->db->get()->result_array();
                }
            } else {
                $result = $this->db->select('sections_allocation.section_id,section.name as section_name')
                    ->from('sections_allocation')
                    ->join('section', 'section.id = sections_allocation.section_id', 'left')
                    ->where('sections_allocation.class_id', $classID)
                    ->get()->result_array();
            }
            if (count($result)) {
                if ($multi == false) {
                   $html .= '<option value="">' . translate('select') . '</option>';
                }
                if ($mode == true && !is_array($getClassTeacher)) {
                    $html .= '<option value="all">' . translate('all_sections') . '</option>';
                }
                foreach ($result as $row) {
                    $html .= '<option value="' . $row['section_id'] . '">' . $row['section_name'] . '</option>';
                }
            } else {
                $html .= '<option value="">' . translate('no_selection_available') . '</option>';
            }
        } else {
            $html .= '<option value="">' . translate('select_class_first') . '</option>';
        }
        echo $html;
    }

    public function getStafflistRole()
    {
        $html = "";
        $branch_id = $this->application_model->get_branch_id();
        if (!empty($branch_id)) {
            $role_id = $this->input->post('role_id');
            $selected_id = (isset($_POST['staff_id']) ? $_POST['staff_id'] : 0);
            $this->db->select('staff.id,staff.name,staff.staff_id,lc.role');
            $this->db->from('staff');
            $this->db->join('login_credential as lc', 'lc.user_id = staff.id AND lc.role != 6 AND lc.role != 7', 'inner');
            $this->db->where('lc.role', $role_id);
            $this->db->where('staff.branch_id', $branch_id);
            $this->db->order_by('staff.id', 'asc');
            $result = $this->db->get()->result_array();
            if (count($result)) {
                $html .= "<option value=''>" . translate('select') . "</option>";
                foreach ($result as $staff) {
                    $selected = ($staff['id'] == $selected_id ? 'selected' : '');
                    $html .= "<option value='" . $staff['id'] . "' " . $selected . ">" . $staff['name'] . " (" . $staff['staff_id'] . ")</option>";
                }
            } else {
                $html .= '<option value="">' . translate('no_information_available') . '</option>';
            }
        } else {
            $html .= '<option value="">' . translate('select_branch_first') . '</option>';
        }
        echo $html;
    }

    // get staff all details
    public function getEmployeeList()
    {
        $html = "";
        $role_id = $this->input->post('role');
        $department = $this->input->post('department');
        $selected_id = (isset($_POST['staff_id']) ? $_POST['staff_id'] : 0);
        $this->db->select('staff.*,login_credential.role as role_id, roles.name as role');
        $this->db->from('staff');
        $this->db->join('login_credential', 'login_credential.user_id = staff.id', 'inner');
        $this->db->join('roles', 'roles.id = login_credential.role', 'left');
        $this->db->where('login_credential.role', $role_id);
        $this->db->where('login_credential.active', 1);

        if ($department != '') {
            $this->db->where('staff.department', $department);
        }

        $result = $this->db->get()->result_array();
        if (count($result)) {
            $html .= "<option value=''>" . translate('select') . "</option>";
            foreach ($result as $row) {
                $selected = ($row['id'] == $selected_id ? 'selected' : '');
                $html .= "<option value='" . $row['id'] . "' " . $selected . ">" . $row['name'] . " (" . $row['staff_id'] . ")</option>";
            }
        } else {
            $html .= '<option value="">' . translate('no_information_available') . '</option>';
        }
        echo $html;
    }

    // get subject list based on the class
    public function getSubjectByClass()
    {
        $html = "";
        $classID = $this->input->post('classID');
        if (!empty($classID)) {
            $this->db->select('subject_assign.subject_id,subject.name,subject.subject_code');
            $this->db->from('subject_assign');
            $this->db->join('subject', 'subject.id = subject_assign.subject_id', 'left');
            $this->db->where('subject_assign.class_id', $classID);
            if (!is_superadmin_loggedin()) {
                $this->db->where('subject_assign.branch_id', get_loggedin_branch_id());
            }
            $subjects = $this->db->get()->result_array();
            if (count($subjects)) {
                $html .= '<option value="">' . translate('select') . '</option>';
                foreach ($subjects as $row) {
                    $html .= '<option value="' . $row['subject_id'] . '">' . $row['name'] . ' (' . $row['subject_code'] . ')</option>';
                }
            } else {
                $html .= '<option value="">' . translate('no_information_available') . '</option>';
            }
        } else {
            $html .= '<option value="">' . translate('select_class_first') . '</option>';
        }
        echo $html;
    }

    public function getLoginAuto()
    {
        if (is_superadmin_loggedin()) {
            $getBranch = $this->getBranchDetails();
            $data = array();
            if ($getBranch['stu_generate'] == 1) {
               $data['student'] = 1;
            } else {
                $data['student'] = 0;
            }

            if ($getBranch['grd_generate'] == 1) {
                $data['guardian'] = 1;
            } else {
                $data['guardian'] = 0;
            }
            echo json_encode($data);
        }
    }
}
