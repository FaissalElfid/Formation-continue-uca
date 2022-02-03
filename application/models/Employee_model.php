<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Employee_model extends MY_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    // moderator employee all information
    public function save($data, $role = null, $id = null)
    {
        $inser_data1 = array(
            'branch_id' => $this->application_model->get_branch_id(),
            'name' => $data['name'],
            'sex' => $data['sex'],
            'mobileno' => $data['mobile_no'],
            'present_address' => $data['present_address'],
            'photo' => $this->uploadImage('staff'),
            'department' => $data['department_id'],
            'email' => $data['email'],
        );

        $inser_data2 = array(
            'username' => $data["username"],
            'role' => $data["user_role"],
        );

        if (empty($data['staff_id'])) {
            // RANDOM STAFF ID GENERATE
            $inser_data1['staff_id'] = substr(app_generate_hash(), 3, 7);
            // SAVE EMPLOYEE INFORMATION IN THE DATABASE
            $this->db->insert('staff', $inser_data1);
            $employeeID = $this->db->insert_id();

            // SAVE EMPLOYEE LOGIN CREDENTIAL INFORMATION IN THE DATABASE
            $inser_data2['active'] = 1;
            $inser_data2['user_id'] = $employeeID;
            $inser_data2['password'] = $this->app_lib->pass_hashed($data["password"]);
            $this->db->insert('login_credential', $inser_data2);
            return $employeeID;
        } else {
            $inser_data1['staff_id'] = $data['staff_id_no'];
            // UPDATE ALL INFORMATION IN THE DATABASE
            if (!is_superadmin_loggedin()) {
                $this->db->where('branch_id', get_loggedin_branch_id());
            }
            $this->db->where('id', $data['staff_id']);
            $this->db->update('staff', $inser_data1);
            // UPDATE LOGIN CREDENTIAL INFORMATION IN THE DATABASE
            $this->db->where('user_id', $data['staff_id']);
            $this->db->where_not_in('role', array(6,7));
            $this->db->update('login_credential', $inser_data2);
        }
    }


    // GET SINGLE EMPLOYEE DETAILS
    public function getSingleStaff($id = '')
    {
        $this->db->select('staff.*,section.name as section_name, section.capacity as section_place,login_credential.role as role_id,login_credential.active,login_credential.username, roles.name as role');
        $this->db->from('staff');
        $this->db->join('login_credential', 'login_credential.user_id = staff.id and login_credential.role != "6" and login_credential.role != "7"', 'inner');
        $this->db->join('roles', 'roles.id = login_credential.role', 'left');
        $this->db->join('section', 'section.id = staff.department', 'left');
        $this->db->where('staff.id', $id);
        if (!is_superadmin_loggedin()) {
            $this->db->where('staff.branch_id', get_loggedin_branch_id());
        }
        $query = $this->db->get();
        if ($query->num_rows() == 0) {
            show_404();
        }
        return $query->row_array();
    }

    // get staff all list
    public function getStaffList($branchID = '', $role_id, $active = 1)
    {
        $this->db->select('staff.*,section.name as section_name, section.capacity as section_place,login_credential.role as role_id, roles.name as role');
        $this->db->from('staff');
        $this->db->join('login_credential', 'login_credential.user_id = staff.id and login_credential.role != "6" and login_credential.role != "7"', 'inner');
        $this->db->join('roles', 'roles.id = login_credential.role', 'left');
        $this->db->join('section', 'section.id = staff.department', 'left');
        if ($branchID != "") {
            $this->db->where('staff.branch_id', $branchID);
        }
        $this->db->where('login_credential.role', $role_id);
        $this->db->where('login_credential.active', $active);
        $this->db->order_by('staff.id', 'ASC');
        return $this->db->get()->result();
    }

    public function get_schedule_by_id($id)
    {
        $this->db->select('timetable_class.*,subject.name as subject_name,class.name as class_name,section.name as section_name');
        $this->db->from('timetable_class');
        $this->db->join('subject', 'subject.id = timetable_class.subject_id', 'inner');
        $this->db->join('class', 'class.id = timetable_class.class_id', 'inner');
        $this->db->join('section', 'section.id = timetable_class.section_id', 'inner');
        $this->db->where('timetable_class.teacher_id', $id);
        $this->db->where('timetable_class.session_id', get_session_id());
        return $this->db->get();
    }

    public function bankSave($data)
    {
        $inser_data = array(
            'staff_id' => $data['staff_id'],
            'bank_name' => $data['bank_name'],
            'holder_name' => $data['holder_name'],
            'bank_branch' => $data['bank_branch'],
            'bank_address' => $data['bank_address'],
            'ifsc_code' => $data['ifsc_code'],
            'account_no' => $data['account_no'],
        );
        if (isset($data['bank_id'])) {
            $this->db->where('id', $data['bank_id']);
            $this->db->update('staff_bank_account', $inser_data);
        } else {
            $this->db->insert('staff_bank_account', $inser_data);
        }
    }

    public function csvImport($row, $branchID, $userRole, $departmentID)
    {
        $inser_data1 = array(
            'name' => $row['Name'],
            'sex' => $row['Gender'],
            'mobileno' => $row['MobileNo'],
            'present_address' => $row['PresentAddress'],
            'email' => $row['Email'],
            'department' => $departmentID,
            'branch_id' => $branchID,
            'photo' => 'defualt.png',
        );

        $inser_data2 = array(
            'username' => $row["Email"],
            'role' => $userRole,
        );

        // RANDOM STAFF ID GENERATE
        $inser_data1['staff_id'] = substr(app_generate_hash(), 3, 7);
        // SAVE EMPLOYEE INFORMATION IN THE DATABASE
        $this->db->insert('staff', $inser_data1);
        $employeeID = $this->db->insert_id();

        // SAVE EMPLOYEE LOGIN CREDENTIAL INFORMATION IN THE DATABASE
        $inser_data2['active'] = 1;
        $inser_data2['user_id'] = $employeeID;
        $inser_data2['password'] = $this->app_lib->pass_hashed($row["Password"]);
        $this->db->insert('login_credential', $inser_data2);
        return true;
    }
}
