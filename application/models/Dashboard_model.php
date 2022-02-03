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
        return $this->db->get()->row_array();
    }

    /* student annual attendance charts */
    public function getStudentAttendance($studentID = '')
    {
        $total_present = array();
        $total_absent = array();
        $total_late = array();
        for ($month = 1; $month <= 12; $month++):
            $total_present[] = $this->db->query("SELECT id FROM student_attendance WHERE MONTH(date) = " . $this->db->escape($month) . " AND YEAR(date) = YEAR(CURDATE()) AND status = 'P' AND student_id = " . $this->db->escape($studentID))->num_rows();
            $total_absent[] = $this->db->query("SELECT id FROM student_attendance WHERE MONTH(date) = " . $this->db->escape($month) . " AND YEAR(date) = YEAR(CURDATE()) AND status = 'A' AND student_id = " . $this->db->escape($studentID))->num_rows();
            $total_late[] = $this->db->query("SELECT id FROM student_attendance WHERE MONTH(date) = " . $this->db->escape($month) . " AND YEAR(date) = YEAR(CURDATE()) AND status = 'L' AND student_id = " . $this->db->escape($studentID))->num_rows();
        endfor;
        return array(
            'total_present' => $total_present,
            'total_absent' => $total_absent,
            'total_late' => $total_late,
        );
    }

    public function get_monthly_attachments($id = '')
    {
        $branchID = get_loggedin_branch_id();
        $classID = $this->db->select('class_id')->where('student_id', $id)->get('enroll')->row()->class_id;
        $this->db->select('id');
        $this->db->from('attachments');
        $this->db->where("date BETWEEN DATE_SUB(CURDATE() ,INTERVAL 1 MONTH) AND CURDATE() AND (class_id = " . $this->db->escape($classID) . " OR class_id = 'unfiltered') AND branch_id = " . $this->db->escape($branchID));
        return $this->db->get()->num_rows();
    }

    /* total academic students strength classes divided into charts */
    public function getStudentByClass($branchID = '')
    {
        $this->db->select('IFNULL(COUNT(e.student_id), 0) as total_student, c.name as class_name');
        $this->db->from('enroll as e');
        $this->db->join('class as c', 'c.id = e.class_id', 'inner');
        $this->db->group_by('e.class_id');
        if (!empty($branchID)) {
            $this->db->where('e.branch_id', $branchID);
        }

        $query = $this->db->get();
        $data = array();
        if ($query->num_rows() > 0) {
            $students = $query->result();
            foreach ($students as $row) {
                $data[] = ['value' => floatval($row->total_student), 'name' => $row->class_name];
            }
        } else {
            $data[] = ['value' => 0, 'name' => translate('not_found_anything')];
        }
        return $data;
    }

    public function get_total_student($branchID = '')
    {
        $this->db->select('IFNULL(COUNT(enroll.id), 0) as total_student');
        $this->db->from('enroll');
        $this->db->join('student', 'student.id = enroll.student_id', 'inner');
        if (!empty($branchID)) {
            $this->db->where('enroll.branch_id', $branchID);
        }
        return $this->db->get()->row()->total_student;
    }

    public function getMonthlyAdmission($branchID = '')
    {
        $this->db->select('s.id');
        $this->db->from('student as s');
        $this->db->join('enroll as e', 'e.student_id = s.id', 'inner');
        $this->db->where('s.admission_date BETWEEN DATE_SUB(CURDATE() ,INTERVAL 1 MONTH) AND CURDATE()');
        if (!empty($branchID)) {
            $this->db->where('e.branch_id', $branchID);
        }
        return $this->db->get()->num_rows();
    }
}
