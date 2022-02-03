<!-- Main Banner Starts -->
<div class="main-banner"
     style="background: url(<?php echo base_url('uploads/frontend/banners/' . $page_data['banner_image']); ?>) center top;">
    <div class="container px-md-0">
        <h2><span><?php echo $page_data['page_title']; ?></span></h2>
    </div>
</div>
<!-- Main Banner Ends -->
<!-- Breadcrumb Starts -->
<div class="breadcrumb">
    <div class="container px-md-0">
        <ul class="list-unstyled list-inline">
            <li class="list-inline-item"><a href="<?php echo base_url('home') ?>">Home</a></li>
            <li class="list-inline-item active"><?php echo $page_data['menu_title']; ?></li>
        </ul>
    </div>
</div>
<!-- Breadcrumb Ends -->
<!-- Main Container Starts -->
<div class="container px-md-0 main-container">
    <h2 style="margin-bottom: 25px">Listes des formations continues</h2>
    <div class="tab-content">
        <?php
        if (count($classlist)) {
            foreach ($classlist as $row):
                ?>
                <h3 style="margin-left: 25px;"><font color="#ff0000"><?php echo $row['name']; ?></font></h3>
                <p style="margin-top: 25px">
                    <?php
                    $sections = $this->db->get_where("sections_allocation", array('class_id' => $row['id']))->result();
                    foreach ($sections as $section) {
                        echo "<div style=\"margin-top: 15px;margin-left: 25px;\">";
                        echo get_type_name_by_id('section', $section->section_id) . "<a  target=\"_blank\" href=". base_url('uploads/attachments/'. $this->db->select('enc_name')->where('class_id', $section->section_id)->get('attachments')->row()->enc_name) ." style=\"background-color: rgb(255, 255, 255); float: right\">Plaquette</a><br>";
                        echo "</div>";
                    }

                    ?>
                </p>
            <?php
            endforeach;
        } else {
            echo '<tr><td colspan="6"><h5 class="text-danger text-center">' . translate('no_information_available') . '</td></tr>';
        }
        ?>

    </div>
    <!--    --><?php //echo $page_data['content']; ?>
</div>
