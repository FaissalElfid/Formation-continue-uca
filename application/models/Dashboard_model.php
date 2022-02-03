<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Dashboard_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function getStaffCounter($role = '', $branchID = '')
    {
        $this->db->select('count(staff.id) as snumber');
        $this->db->from('staff');
        $this->db->join('login_credential', 'login_credential.user_id = staff.id', 'inner');
        $this->db->where_not_in('login_credential.role', 1);
        if (!empty($role)) {
            $this->db->where('login_credential.role', $role);
        } else {
            $this->db->where_not_in('login_credential.role', array(1, 3, 6, 7));
        }
        if (!empty($branchID)) {
            $this->db->where('staff.branch_id', $branchID);
        }
        return $this->db->get()->num_rows();
    }

    public function getMonthlyAdmission($branchID = '')
    {
        $this->db->select('s.id');
        $this->db->from('online_admission as s');
        $this->db->where('s.created_date BETWEEN DATE_SUB(CURDATE() ,INTERVAL 1 MONTH) AND CURDATE()');
        if (!empty($branchID)) {
            $this->db->where('s.branch_id', $branchID);
        }
        return $this->db->get()->num_rows();
    }
}
