<header class="header">
    <div class="logo-env">
        <a href="<?php echo base_url('dashboard'); ?>" class="logo">
            <img src="<?= $this->application_model->getBranchImage(get_loggedin_branch_id(), 'logo-small') ?>"
                 height="40">
        </a>

        <div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html"
             data-fire-event="sidebar-left-opened">
            <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
        </div>
    </div>

    <div class="header-left hidden-xs">
        <ul class="header-menu">
            <!-- sidebar toggle button -->
            <li>
                <div class="header-menu-icon sidebar-toggle" data-toggle-class="sidebar-left-collapsed"
                     data-target="html" data-fire-event="sidebar-left-toggle">
                    <i class="fas fa-bars" aria-label="Toggle sidebar"></i>
                </div>
            </li>
            <!-- full screen button -->
            <li>
                <div class="header-menu-icon s-expand">
                    <i class="fas fa-expand"></i>
                </div>
            </li>
        </ul>

        <!-- search bar -->
        <?php if (get_permission('student', 'is_view')): ?>
            <span class="separator hidden-sm"></span>
            <?php echo form_open('student/search', array('class' => 'search nav-form')); ?>
            <div class="input-group input-search">
                <input type="text" class="form-control" name="search_text" id="search_text"
                       placeholder="<?php echo translate('search'); ?>">
                <span class="input-group-btn">
						<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
					</span>
            </div>
            </form>
        <?php endif; ?>
    </div>

    <div class="header-right">
        <ul class="header-menu">
            <?php
            $showwebURL = false;
            $webURL = "";
            if (is_superadmin_loggedin()) {
                $showwebURL = true;
                $webURL = base_url('home');
            } else {
                $cmsRow = $this->db->select('cms_active,url_alias')
                    ->where('branch_id', get_loggedin_branch_id())
                    ->get('front_cms_setting')->row_array();
                if ($cmsRow['cms_active'] == 1) {
                    $showwebURL = true;
                }
                $webURL = base_url('home/index/' . $cmsRow['url_alias']);
            }
            if ($showwebURL) {
                ?>
                <!-- website link -->
                <li>
                    <a href="<?php echo $webURL; ?>" target="_blank" class="header-menu-icon" data-toggle="tooltip"
                       data-placement="bottom"
                       data-original-title="<?php echo translate('visit_home_page'); ?>">
                        <i class="fas fa-globe"></i>
                    </a>
                </li>
            <?php } ?>
            <!-- session switcher box -->
            <li>
                <a href="#" class="dropdown-toggle header-menu-icon" data-toggle="dropdown">
                    <i class="far fa-calendar-alt"></i>
                </a>
                <div class="dropdown-menu header-menubox mh-oh">
                    <div class="notification-title">
                        <i class="far fa-calendar-alt"></i> <?php echo translate('academic_session'); ?>
                    </div>
                    <div class="content hbox pr-none">
                        <div class="scrollable visible-slider dh-tf" data-plugin-scrollable>
                            <div class="scrollable-content">
                                <ul>
                                    <?php
                                    $get_session = $this->db->get('schoolyear')->result();
                                    foreach ($get_session as $session) :
                                        ?>
                                        <li>
                                            <a href="<?php echo base_url('sessions/set_academic/' . $session->id); ?>">
                                                <?php echo $session->school_year; ?><?php echo get_session_id() == $session->id ? '<i class="fas fa-check"></i>' : ''; ?>
                                            </a>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </li>

            <!-- languages switcher box -->
            <li>
                <a href="#" class="dropdown-toggle header-menu-icon" data-toggle="dropdown">
                    <i class="far fa-flag"></i>
                </a>
                <div class="dropdown-menu header-menubox mh-oh">
                    <div class="notification-title">
                        <i class="far fa-flag"></i> <?php echo translate('language'); ?>
                    </div>
                    <div class="content hbox lb-pr">
                        <div class="scrollable visible-slider dh-tf" data-plugin-scrollable>
                            <div class="scrollable-content">
                                <ul>
                                    <?php
                                    if ($this->session->has_userdata('set_lang')) {
                                        $set_lang = $this->session->userdata('set_lang');
                                    } else {
                                        $set_lang = get_global_setting('translation');
                                    }
                                    $languages = $this->db->select('id,lang_field,name')->where('status', 1)->get('language_list')->result();
                                    foreach ($languages as $lang) :
                                        ?>
                                        <li>
                                            <a href="<?php echo base_url('translations/set_language/' . html_escape($lang->lang_field)); ?>">
                                                <img class="ln-img"
                                                     src="<?php echo $this->application_model->getLangImage($lang->id); ?>"
                                                     alt="<?php echo $lang->lang_field; ?>"> <?php echo ucfirst(html_escape($lang->name)); ?> <?php echo($set_lang == $lang->lang_field ? '<i class="fas fa-check"></i>' : ''); ?>
                                            </a>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>

        <!-- user profile box -->
        <span class="separator"></span>
        <div id="userbox" class="userbox">
            <a href="#" data-toggle="dropdown">
                <figure class="profile-picture">
                    <img src="<?php echo get_image_url(get_loggedin_user_type(), $this->session->userdata('logger_photo')); ?>"
                         alt="user-image" class="img-circle" height="35">
                </figure>
            </a>
            <div class="dropdown-menu">
                <ul class="dropdown-user list-unstyled">
                    <li class="user-p-box">
                        <div class="dw-user-box">
                            <div class="u-img">
                                <img src="<?php echo get_image_url(get_loggedin_user_type(), $this->session->userdata('logger_photo')); ?>"
                                     alt="user">
                            </div>
                            <div class="u-text">
                                <h4><?php echo $this->session->userdata('name'); ?></h4>
                                <p class="text-muted"><?php echo ucfirst(loggedin_role_name()); ?></p>
                                <a href="<?php echo base_url('authentication/logout'); ?>"
                                   class="btn btn-danger btn-xs"><i
                                            class="fas fa-sign-out-alt"></i> <?php echo translate('logout'); ?></a>
                            </div>
                        </div>
                    </li>
                    <li role="separator" class="divider"></li>
                    <li><a href="<?php echo base_url('profile'); ?>"><i
                                    class="fas fa-user-shield"></i> <?php echo translate('profile'); ?></a></li>
                    <li><a href="<?php echo base_url('profile/password'); ?>"><i
                                    class="fas fa-mars-stroke-h"></i> <?php echo translate('reset_password'); ?></a>
                    </li>
<!--                    <li><a href="--><?php //echo base_url('communication/mailbox/inbox'); ?><!--"><i-->
<!--                                    class="far fa-envelope"></i> --><?php //echo translate('mailbox'); ?><!--</a></li>-->
                    <?php if (get_permission('global_settings', 'is_view')): ?>
                        <li role="separator" class="divider"></li>
                        <li><a href="<?php echo base_url('settings/universal'); ?>"><i
                                        class="fas fa-toolbox"></i> <?php echo translate('global_settings'); ?></a></li>
                    <?php endif; ?>
                    <?php if (get_permission('school_settings', 'is_view') && !is_superadmin_loggedin()): ?>
                        <li role="separator" class="divider"></li>
                        <li><a href="<?php echo base_url('settings/school'); ?>"><i
                                        class="fas fa-school"></i> <?php echo translate('school_settings'); ?></a></li>
                    <?php endif; ?>
                    <li role="separator" class="divider"></li>
                    <li><a href="<?php echo base_url('authentication/logout'); ?>"><i
                                    class="fas fa-sign-out-alt"></i> <?php echo translate('logout'); ?></a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
