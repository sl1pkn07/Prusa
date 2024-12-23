// PRUSA iteration3
// Bearing holders
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <polyholes_for_SLS.scad>

bearing_diameter = 14.75;

module horizontal_bearing_base(bearings=1){
    translate([0,0,6]) cube([24,8+bearings*25,12],center=true);
}

module horizontal_bearing_holes(bearings=1){
    cutter_lenght = 10+bearings*25;
    one_holder_lenght = 8+25;
    holder_lenght = 8+bearings*25;

    // Main bearing cut
    difference(){
        translate([0,0,12]) rotate([90,0,0]) translate([0,0,-cutter_lenght/2]) cylinder(h=cutter_lenght,r=(bearing_diameter/2)+0.2,$fn=50);

        // Bearing retainers
        translate([0,1-holder_lenght/2,3]) cube([24,6,8],center=true);
        translate([0,-1+holder_lenght/2,3]) cube([24,6,8],center=true);
    }

    // Ziptie cutouts
    ziptie_cut_ofset = 0;
    for (i=[0:bearings-1] ){
        // For easier positioning I move them by half of one
        // bearing holder then add each bearign lenght and then center again
        translate([0,-holder_lenght/2,0]) translate([0,one_holder_lenght/2+i*25,0]) difference(){
            union(){
                translate([0,2-8.5,12]) rotate([90,0,0]) translate([0,0,0]) cylinder(h=4,r=11.5,$fn=50);
                translate([0,2+8.5,12]) rotate([90,0,0]) translate([0,0,0]) cylinder(h=4,r=11.5,$fn=50);
            }
        translate([0,12,12]) rotate([90,0,0]) translate([0,0,0]) cylinder(h=24,r=9,$fn=50);
        }
    }
}

module horizontal_bearing_holes_nozip(bearings=1){
    cutter_lenght = 10+bearings*25;
    one_holder_lenght = 8+25;
    holder_lenght = 8+bearings*25;

    // Main bearing cut
    difference(){
        translate([0,0,12]) rotate([90,0,0]) translate([0,0,cutter_lenght/2]) cylinder(h=cutter_lenght,r=(bearing_diameter/2)+0.2,$fn=50);
        // Bearing retainers
        translate([0,1-holder_lenght/2,3]) cube([24,6,8],center=true);
        translate([0,-1+holder_lenght/2,3]) cube([24,6,8],center=true);
    }
}

module horizontal_bearing_holes_nozip_smooth(bearings=1){
    cutter_lenght = 10+bearings*25;
    one_holder_lenght = 8+25;
    holder_lenght = 8+bearings*25;

    // Main bearing cut
    difference(){
        translate([0,0,12]) rotate([90,0,0]) translate([0,0,-cutter_lenght/2]) cylinder(h=cutter_lenght,r=(bearing_diameter/2)+0.2,$fn=150);
        // Bearing retainers
        translate([0,1-holder_lenght/2,3]) cube([24,6,8],center=true);
        translate([0,-1+holder_lenght/2,3]) cube([24,6,8],center=true);
    }
}

module horizontal_bearing_holes_smooth_nozip(bearings=1){
    cutter_lenght = 10+bearings*25;
    one_holder_lenght = 8+25;
    holder_lenght = 8+bearings*25;

    // Main bearing cut
    difference(){
        translate([0,0,12]) rotate([90,0,0]) translate([0,0,-cutter_lenght/2]) cylinder(h=cutter_lenght,r=(bearing_diameter/2)+0.2,$fn=120);
        // Bearing retainers
        translate([0,1-holder_lenght/2,3]) cube([24,6,8], center=true);
        translate([0,-1+holder_lenght/2,3]) cube([24,6,8], center=true);
    }
}

thinwall = 3;
bearing_size = bearing_diameter + 2 * thinwall;

module vertical_bearing_base(){
    translate([2-bearing_size/4,0,29]) cube([4+bearing_size/2,bearing_size,58],center=true);
    cylinder(h=58,r=bearing_size/2,$fn=250);
}

module vertical_bearing_holes(){
    translate([0,0,-1]) poly_cylinder(h=62,r=(bearing_diameter/2));
    translate([0,0,-0.1]) cylinder(r1=(bearing_diameter/2)+0.7,r2=(bearing_diameter/2),h=0.5);
    rotate([0,0,-40]) translate([bearing_diameter/2-2.9,-0.5,0.5]) cube([thinwall*2,1,62]);
}

difference(){
vertical_bearing_base();
vertical_bearing_holes();
//horizontal_bearing_base(1);
//horizontal_bearing_holes(1);
//horizontal_bearing_holes_nozip(1);
}
