<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Userrole_model extends MY_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function getTeachersList($branchID = '')
    {
        $this->db->select('staff.* as department_name,login_credential.role as role_id, roles.name as role');
        $this->db->from('staff');
        $this->db->join('login_credential', 'login_credential.user_id = staff.id and login_credential.role != "6" and login_credential.role != "7"', 'inner');
        $this->db->join('roles', 'roles.id = login_credential.role', 'left');
        if ($branchID != "") {
            $this->db->where('staff.branch_id', $branchID);
        }
        $this->db->where('login_credential.role', 3);
        $this->db->where('login_credential.active', 1);
        $this->db->order_by('staff.id', 'ASC');
        return $this->db->get()->result();
    }

    // get route information by route id and vehicle id
    public function getRouteDetails($routeID, $vehicleID)
    {
        $this->db->select('ta.route_id,ta.stoppage_id,ta.vehicle_id,r.name as route_name,r.start_place,r.stop_place,sp.stop_position,sp.stop_time,sp.route_fare,v.vehicle_no,v.driver_name,v.driver_phone');
        $this->db->from('transport_assign as ta');
        $this->db->join('transport_route as r', 'r.id = ta.route_id', 'left');
        $this->db->join('transport_vehicle as v', 'v.id = ta.vehicle_id', 'left');
        $this->db->join('transport_stoppage as sp', 'sp.id = ta.stoppage_id', 'left');
        $this->db->where('ta.route_id', $routeID);
        $this->db->where('ta.vehicle_id', $vehicleID);
        return $this->db->get()->row_array();
    }

    public function getAssignList($branch_id = '')
    {
        $this->db->select('ta.route_id,ta.stoppage_id,ta.branch_id,r.name,r.start_place,r.stop_place,sp.stop_position,sp.stop_time,sp.route_fare');
        $this->db->from('transport_assign as ta');
        $this->db->join('transport_route as r', 'r.id = ta.route_id', 'left');
        $this->db->join('transport_stoppage as sp', 'sp.id = ta.stoppage_id', 'left');
        $this->db->group_by(array('ta.route_id', 'ta.stoppage_id', 'ta.branch_id'));
        if (!empty($branch_id)) {
            $this->db->where('ta.branch_id', $branch_id);
        }
        return $this->db->get()->result_array();
    }

    // get vehicle list by route_id
    public function getVehicleList($route_id)
    {
        $this->db->select('ta.vehicle_id,v.vehicle_no');
        $this->db->from('transport_assign as ta');
        $this->db->join('transport_vehicle as v', 'v.id = ta.vehicle_id', 'left');
        $this->db->where('ta.route_id', $route_id);
        $vehicles = $this->db->get()->result();
        $name_list = '';
        foreach ($vehicles as $row) {
            $name_list .= '- ' . $row->vehicle_no . '<br>';
        }
        return $name_list;
    }

    // get hostel information by hostel id and room id
    public function getHostelDetails($hostelID, $roomID)
    {
        $this->db->select('h.name as hostel_name,h.watchman,h.category_id,h.address,hc.name as hcategory_name,rc.name as rcategory_name,hr.name as room_name,hr.no_beds,hr.bed_fee');
        $this->db->from('hostel as h');
        $this->db->join('hostel_category as hc', 'hc.id = h.category_id', 'left');
        $this->db->join('hostel_room as hr', 'hr.hostel_id = h.id', 'left');
        $this->db->join('hostel_category as rc', 'rc.id = hr.category_id', 'left');
        $this->db->where('hr.id', $roomID);
        $this->db->where('h.id', $hostelID);
        return $this->db->get()->row();
    }

    // check attendance by staff id and date
    public function get_attendance_by_date($studentID, $date)
    {
        $sql = "SELECT student_attendance.* FROM student_attendance WHERE student_id = " . $this->db->escape($studentID) . " AND date = " . $this->db->escape($date);
        return $this->db->query($sql)->row_array();
    }

    public function getUserDetails()
    {
        if (is_student_loggedin()) {
            $studentID = get_loggedin_user_id();
            $this->db->select('*,CONCAT(first_name, " ", last_name) as name, current_address as address');
            $this->db->from('student');
        } elseif (is_parent_loggedin()) {
            $this->db->select('*');
            $this->db->from('parent');
        }
        $this->db->where('id', get_loggedin_user_id());
        return $this->db->get()->row_array();
    }

}
