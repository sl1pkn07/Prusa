use <polyholes_for_SLS.scad>
use <x-end-motor_for_SLS.scad>

module pushfit_rod(diameter,length){
    poly_cylinder(h = length, r=diameter/2);
    difference(){
        translate([0,-diameter/2.85,length/2]) rotate([0,0,45]) cube([diameter/2,diameter/2,length],center=true);
        translate([0,-diameter/4-diameter/2-0.4,length/2]) rotate([0,0,0]) cube([diameter,diameter/2,length],center=true);
    }
}

 module x_end_motor_endstop_base(){
    translate([-23.5,-28.5,55]){
        difference(){
            // Base block
            cube([17,18.2,7]);
            // Nice edge
            translate([-1,10,13]) rotate([-45,0,0]) cube([20,20,20]);
        }
    }
}

module x_end_motor_endstop_holes(){
    translate([-23.5,-28.5,58]){
        translate([17/2,7.5,-3]){
            // Back screw hole for endstop
            translate([-4.75,0,0]) cylinder(r=1,h=19,$fn=23);
            translate([-4.75,0,6]) cylinder(r1=1, r2=1.5, h=2,$fn=20);
            // Front screw hole for endstop
            translate([4.75,0,0]) cylinder(r=1,h=19,$fn=23);
            translate([4.75,0,6]) cylinder(r1=1, r2=1.5, h=2,$fn=20);
        }
    }
}

module x_end_motor_endstop() {
    difference(){
        x_end_motor_endstop_base();
        union(){
            x_end_motor_endstop_holes();
            // Top pushfit rod
            translate([-15,-41.5,45+6]) rotate([-90,0,0]) pushfit_rod(7.8,50);
            // endstop notch
            translate([-12,-42,65]) rotate([-35,0,0])  rotate([0,0,45]) cube([10,10,10]);
        }
        
    }
}

x_end_motor_endstop();
difference(){
    end_motor_final();
    union(){
        x_end_motor_endstop_holes();
        // version
        translate([-23.4,-14,2]) rotate([90,0,270]) linear_extrude(height=0.4){
            text("MK2.5S+",font = "helvetica:style=Bold", size=1);
        }
    }
}
