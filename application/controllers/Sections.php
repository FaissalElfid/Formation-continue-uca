<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Ramom school management system
 * @version : 4.0
 * @developed by : Faissal EL FID
 * @support : faissal.elfid@gmail.com
 * @copyright : Reserved for an IRISI Student
 * @filename : Sections.php

 */

class Sections extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        if (!get_permission('section', 'is_view')) {
            access_denied();
        }

        $this->data['sectionlist'] = $this->app_lib->getTable('section');
        $this->data['title'] = translate('section_control');
        $this->data['sub_page'] = 'sections/index';
        $this->data['main_menu'] = 'sections';
        $this->load->view('layout/index', $this->data);
    }

    public function edit($id = '')
    {
        if (!get_permission('section', 'is_edit')) {
            access_denied();
        }
        $this->data['section'] = $this->app_lib->getTable('section', array('t.id' => $id), true);
        $this->data['title'] = translate('section_control');
        $this->data['sub_page'] = 'sections/edit';
        $this->data['main_menu'] = 'sections';
        $this->load->view('layout/index', $this->data);
    }

    public function save()
    {
        if ($_POST) {
            $this->form_validation->set_rules('name', translate('name'), 'trim|required|callback_unique_name');
            $this->form_validation->set_rules('capacity', translate('capacity'), 'trim');
            if ($this->form_validation->run() !== false) {
                $arraySection = array(
                    'name' => $this->input->post('name'),
                    'capacity' => $this->input->post('capacity'),
                    'branch_id' => 1,
                );
                $sectionID = $this->input->post('section_id');
                if (empty($sectionID)) {
                    if (get_permission('section', 'is_add')) {
                        $this->db->insert('section', $arraySection);
                    }
                    set_alert('success', translate('information_has_been_saved_successfully'));
                } else {
                    if (get_permission('section', 'is_edit')) {
                        $this->db->where('branch_id', 1);
                        $this->db->where('id', $sectionID);
                        $this->db->update('section', $arraySection);
                    }
                    set_alert('success', translate('information_has_been_updated_successfully'));
                }
                $url = base_url('sections');
                $array = array('status' => 'success', 'url' => $url, 'error' => '');
            } else {
                $error = $this->form_validation->error_array();
                $array = array('status' => 'fail', 'url' => '', 'error' => $error);
            }
            echo json_encode($array);
        }
    }

    // validate here, if the check sectio name
    public function unique_name($name)
    {
        $branchID = $this->application_model->get_branch_id();
        $sectionID = $this->input->post('section_id');
        if (!empty($sectionID)) {
            $this->db->where_not_in('id', $sectionID);
        }
        $this->db->where(array('name' => $name, 'branch_id' => $branchID));
        $uniform_row = $this->db->get('section')->num_rows();
        if ($uniform_row == 0) {
            return true;
        } else {
            $this->form_validation->set_message("unique_name", translate('already_taken'));
            return false;
        }
    }

    public function delete($id = '')
    {
        if (get_permission('section', 'is_delete')) {
            $this->db->where('branch_id', 1);
            $this->db->where('id', $id);
            $this->db->delete('section');
        }
    }
}
