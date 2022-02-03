<aside id="sidebar-left" class="sidebar-left">
    <div class="sidebar-header">
        <div class="sidebar-title">
            Main
        </div>
    </div>

    <div class="nano">
        <div class="nano-content">
            <nav id="menu" class="nav-main" role="navigation">
                <ul class="nav nav-main">
                    <!-- dashboard -->
                    <?php if (is_superadmin_loggedin()) { ?>
                        <li class="nav-parent <?php if ($main_menu == 'dashboard') echo 'nav-active nav-expanded';?>">
                            <a>
                                <i class="icons icon-grid"></i><span><?=translate('dashboard')?></span>
                            </a>
                            <ul class="nav nav-children">
                                <li class="'nav-active'">
                                    <a href="<?=base_url('dashboard/index?school_id=1')?>">
                                        <span><i class="fas fa-caret-right" aria-hidden="true"></i> UCA</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    <?php } else { ?>
                        <li class="<?php if ($main_menu == 'dashboard') echo 'nav-active'; ?>">
                            <a href="<?=base_url('dashboard')?>">
                                <i class="icons icon-grid"></i><span><?=translate('dashboard')?></span>
                            </a>
                        </li>
                    <?php } ?>

                    <?php
                    if (get_permission('frontend_setting', 'is_view') ||
                        get_permission('frontend_menu', 'is_view') ||
                        get_permission('frontend_section', 'is_view') ||
                        get_permission('manage_page', 'is_view') ||
                        get_permission('frontend_slider', 'is_view') ||
                        get_permission('frontend_features', 'is_view') ||
                        get_permission('frontend_testimonial', 'is_view') ||
                        get_permission('frontend_services', 'is_view') ||
                        get_permission('frontend_faq', 'is_view')) {
                        ?>
                        <!-- Patient Details -->
                        <li class="nav-parent <?php if ($main_menu == 'frontend') echo 'nav-expanded nav-active'; ?>">
                            <a><i class="fas fa-globe"></i><span><?php echo translate('frontend'); ?></span></a>
                            <ul class="nav nav-children">
                                <?php if(get_permission('frontend_setting', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/setting') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/setting'); ?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('setting'); ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('frontend_menu', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/menu' || $sub_page == 'frontend/menu_edit') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/menu'); ?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('menu'); ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('frontend_section', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/section_home' ||
                                        $sub_page == 'frontend/section_doctors' ||
                                        $sub_page == 'frontend/section_appointment' ||
                                        $sub_page == 'frontend/section_faq' ||
                                        $sub_page == 'frontend/section_contact' ||
                                        $sub_page == 'frontend/section_about' ||
                                        $sub_page == 'frontend/section_services') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/section/index'); ?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo " Homepage sections " ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('manage_page', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/content' || $sub_page == 'frontend/content_edit') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/content'); ?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('manage') . " " . translate('page'). " formations"; ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('frontend_slider', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/slider' || $sub_page == 'frontend/slider_edit') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/slider'); ?>">
                                            <span><i class="fas fa-caret-right"></i><?php echo translate('slider'). " news"; ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('frontend_features', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/features' || $sub_page == 'frontend/features_edit') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/features'); ?>">
                                            <span><i class="fas fa-caret-right"></i><?php echo translate('features'); ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('frontend_testimonial', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/testimonial' || $sub_page == 'frontend/testimonial_edit') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/testimonial'); ?>">
                                            <span><i class="fas fa-caret-right"></i><?php echo translate('testimonial'). ' section'; ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('frontend_services', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/services' || $sub_page == 'frontend/services_edit') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/services'); ?>">
                                            <span><i class="fas fa-caret-right"></i><?php echo translate('service'); ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('frontend_faq', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/faq' || $sub_page == 'frontend/faq_edit') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/faq'); ?>">
                                            <span><i class="fas fa-caret-right"></i><?php echo translate('faq'); ?></span>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </li>
                    <?php } ?>
                    <?php
                    if(get_permission('employee', 'is_view') ||
                        get_permission('employee', 'is_add') ||
                        get_permission('employee_disable_authentication', 'is_view')) {
                        ?>
                        <!-- Employees -->
                        <li class="nav-parent <?php if ($main_menu == 'employee') echo 'nav-expanded nav-active'; ?>">
                            <a><i class="fas fa-users"></i><span>Responsable de filière</span></a>
                            <ul class="nav nav-children">
                                <?php if(get_permission('employee', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'employee/view' ||  $sub_page == 'employee/profile' ) echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('employee/view'); ?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('employee_list'); ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('employee', 'is_add')){ ?>
                                    <li class="<?php if ($sub_page == 'employee/add') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('employee/add'); ?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('add_employee'); ?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('employee_disable_authentication', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'employee/disable_authentication') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('employee/disable_authentication'); ?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('login_deactivate'); ?></span>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </li>
                    <?php } ?>
                    <?php
                    if(get_permission('classes', 'is_view') ||
                        get_permission('section', 'is_view')) {
                        ?>
                        <!-- academic -->
                        <li class="nav-parent <?php if ($main_menu == 'classes' ||
                            $main_menu == 'sections' ) echo 'nav-expanded nav-active';?>">
                            <a>
                                <i class="icons icon-home" aria-hidden="true"></i><span><?=translate('class') . " & ". translate('section')?></span>
                            </a>
                            <!-- class -->
                            <ul class="nav nav-children">
                                    <li class="<?php if ($sub_page == 'classes/index' ||
                                        $sub_page == 'classes/edit' ||
                                        $sub_page == 'sections/index' ||
                                        $sub_page == 'sections/edit') echo 'nav-active';?>">
                                        <a href="<?=get_permission('classes', 'is_view') ? base_url('classes') : base_url('sections'); ?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?=translate('class')?></>
                                        </a>
                                    </li>
                            </ul>
                        </li>
                    <?php } ?>

                    <?php
                    if (get_permission('online_admission', 'is_view')) {
                        ?>
                        <!-- admission -->
                        <li class="nav-parent <?php if ($main_menu == 'admission') echo 'nav-expanded nav-active';?>">
                            <a>
                                <i class="far fa-edit"></i><span><?=translate('admission')?></span>
                            </a>
                            <ul class="nav nav-children">
                                <?php if(get_permission('online_admission', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'online_admission') echo 'nav-active';?>">
                                        <a href="<?=base_url('online_admission')?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?=translate('online_admission')?></span>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </li>
                    <?php } ?>

                    <?php
                    if(get_permission('attachments', 'is_view')) {
                        ?>
                        <!-- attachments upload -->
                        <li class="nav-parent <?php if ($main_menu == 'attachments') echo 'nav-expanded nav-active';?>">
                            <a>
                                <i class="icons icon-cloud-upload"></i><span>Plaquettes</span>
                            </a>
                            <ul class="nav nav-children">
                                <?php if(get_permission('attachments', 'is_view')) { ?>
                                    <li class="<?php if ($sub_page == 'attachments/index') echo 'nav-active';?>">
                                        <a href="<?=base_url('attachments')?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i>Upload Plaquette</span>
                                        </a>
                                    </li>
                                <?php }?>
                            </ul>
                        </li>
                    <?php } ?>
                    <?php

                    $schoolSettings = false;
                    if (get_permission('school_settings', 'is_view') ||
                        get_permission('live_class_config', 'is_view')) {
                        $schoolSettings = true;
                    }
                    if (get_permission('global_settings', 'is_view') ||
                        ($schoolSettings == true) ||
                        get_permission('translations', 'is_view') ||
                        get_permission('custom_field', 'is_view') ||
                        get_permission('backup', 'is_view')) {
                        ?>
                        <!-- setting -->
                        <li class="nav-parent <?php if ($main_menu == 'settings' || $main_menu == 'school_m') echo 'nav-expanded nav-active';?>">
                            <a>
                                <i class="icons icon-briefcase"></i><span><?=translate('settings')?></span>
                            </a>
                            <ul class="nav nav-children">
                                <?php if(get_permission('global_settings', 'is_view')){ ?>
                                    <li class="<?php if($sub_page == 'settings/universal') echo 'nav-active';?>">
                                        <a href="<?=base_url('settings/universal')?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?=translate('global_settings')?></span>
                                        </a>
                                    </li>
                                <?php }?>
                                <?php if (is_superadmin_loggedin()) { ?>
                                    <li class="<?php if ($sub_page == 'sessions/index') echo 'nav-active';?>">
                                        <a href="<?=base_url('sessions')?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?=translate('session_settings')?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('translations', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'language/index') echo 'nav-active';?>">
                                        <a href="<?=base_url('translations')?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?=translate('translations')?></span>
                                        </a>
                                    </li>
                                <?php } ?>
                                <?php if(get_permission('custom_field', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'custom_field/index') echo 'nav-active';?>">
                                        <a href="<?=base_url('custom_field')?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?=translate('custom_field')?></span>
                                        </a>
                                    </li>
                                <?php } if(get_permission('backup', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'database_backup/index') echo 'nav-active';?>">
                                        <a href="<?=base_url('backup')?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?=translate('database_backup')?></span>
                                        </a>
                                    </li>
                                <?php }?>
                            </ul>
                        </li>
                    <?php } ?>
                </ul>
            </nav>
        </div>
        <script>
            // maintain scroll position
            if (typeof localStorage !== 'undefined') {
                if (localStorage.getItem('sidebar-left-position') !== null) {
                    var initialPosition = localStorage.getItem('sidebar-left-position'),
                        sidebarLeft = document.querySelector('#sidebar-left .nano-content');
                    sidebarLeft.scrollTop = initialPosition;
                }
            }
        </script>
    </div>
</aside>
<!-- end sidebar -->
