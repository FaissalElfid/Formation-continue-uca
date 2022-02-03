<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Ramom school management system
 * @version : 4.0
 * @developed by : Faissal EL FID
 * @support : faissal.elfid@gmail.com
 * @copyright : Reserved for an IRISI Student
 * @filename : Online_admission.php

 */

class Online_admission extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->helpers('custom_fields');
        $this->load->model('online_admission_model');
    }

    public function index()
    {
        // check access permission
        if (!get_permission('online_admission', 'is_view')) {
            access_denied();
        }
        $branchID = 1;
        $sectionLogginID=get_loggedin_section();

        if (isset($_POST['search'])) {
            $classID = $this->input->post('class_id');
            $sectionID = $this->input->post('section_id');
            $this->data['students'] = $this->online_admission_model->getOnlineAdmission($sectionID);
        }
        if(isset($sectionLogginID) && is_teacher_loggedin()){
            $this->data['students'] = $this->online_admission_model->getOnlineAdmission($sectionLogginID);
        }
        $this->data['branch_id'] = $branchID;
        $this->data['title'] = translate('student_list');
        $this->data['main_menu'] = 'admission';
        $this->data['sub_page'] = 'online_admission/index';
        $this->data['headerelements'] = array(
            'js' => array(
                'js/student.js',
            ),
        );
        $this->load->view('layout/index', $this->data);
    }

    // delete student from database
    public function delete($id)
    {
        if (get_permission('online_admission', 'is_delete')) {
            $branch_id = $this->db->select('branch_id')
                ->where('id', $id)->get('online_admission')
                ->row()->branch_id;

            if (!is_superadmin_loggedin()) {
                $this->db->where('branch_id', get_loggedin_branch_id());
            }
            $this->db->where('id', $id);
            $this->db->delete('online_admission');
            if ($this->db->affected_rows() > 0) {
                $result = $this->db
                ->where(array('form_to' => 'online_admission', 'branch_id' => $branch_id))
                ->get('custom_field')->result_array();
                foreach ($result as $key => $value) {
                    $this->db->where('relid', $id);
                    $this->db->where('field_id', $value['id']);
                    $this->db->delete('custom_fields_values');
                }
            }
        }
    }

    public function decline($id)
    {
        if (get_permission('online_admission', 'is_add')) {
            if (!is_superadmin_loggedin()) {
                $this->db->where('branch_id', get_loggedin_branch_id());
            }
            $this->db->where('id', $id);
            $this->db->update('online_admission', array('status' => 3));
        }
    }

    public function approved($student_id = '')
    {
        // check access permission
        if (!get_permission('online_admission', 'is_add')) {
            access_denied();
        }
        $stuDetails = $this->online_admission_model->get('online_admission', array('id' => $student_id, 'status !=' => 2), true, true);
        $this->db->where('id', $stuDetails['id']);
        $this->db->update('online_admission', array('status' => 2));
        set_alert('success', translate('information_has_been_saved_successfully'));
        redirect(base_url('online_admission'));

        $this->data['stuDetails'] = $stuDetails;
        $this->data['getBranch'] = 1;
        $this->data['sub_page'] = 'online_admission/approved';
        $this->data['main_menu'] = 'admission';
        $this->data['register_id'] = $this->online_admission_model->regSerNumber();
        $this->data['title'] = translate('online_admission');
        $this->data['headerelements'] = array(
            'css' => array(
                'vendor/dropify/css/dropify.min.css',
            ),
            'js' => array(
                'js/student.js',
                'vendor/dropify/js/dropify.min.js',
            ),
        );
        $this->load->view('layout/index', $this->data);
    }

    /* unique valid student roll verification is done here */
    public function unique_roll($roll)
    {
        if (empty($roll)) {
            return true;
        }
        $branchID = $this->application_model->get_branch_id();
        $classID = $this->input->post('class_id');
        if ($this->uri->segment(3)) {
            $this->db->where_not_in('student_id', $this->uri->segment(3));
        }
        $this->db->where(array('roll' => $roll, 'class_id' => $classID, 'branch_id' => $branchID));
        $q = $this->db->get('enroll')->num_rows();
        if ($q == 0) {
            return true;
        } else {
            $this->form_validation->set_message("unique_roll", translate('already_taken'));
            return false;
        }
    }

    /* unique valid register ID verification is done here */
    public function unique_registerid($register)
    {
        $branchID = $this->application_model->get_branch_id();
        if ($this->uri->segment(3)) {
            $this->db->where_not_in('id', $this->uri->segment(3));
        }
        $this->db->where('register_no', $register);
        $query = $this->db->get('student')->num_rows();
        if ($query == 0) {
            return true;
        } else {
            $this->form_validation->set_message("unique_registerid", translate('already_taken'));
            return false;
        }
    }
}
