// PRUSA iteration4
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <x-end.scad>

module x_end_motor_base(){
    x_end_base();
    translate([-15,31,26.5]) cube([17,44,53],center=true);
}

module x_end_motor_holes(){
   x_end_holes();

    // Position to place
    translate([-1,32,30.25]){
        // Belt hole
        translate([-19,-21,-12]) cube([10,25,22]);

        // Motor mounting holes
        for (x=[-1:0.25:1]){
            translate([0,-15.5+x,15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=30,r=1.55,$fn=60);
            translate([0,-15.5+x,15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=18,r2=1.55,r1=1.7,$fn=60);
            translate([1,-15.5+x,15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=10,r=3.05,$fn=60);

            translate([20,-15.5+x,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70,r=1.6,$fn=30);
            translate([0,-15.5+x,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=18,r2=1.55,r1=1.7,$fn=60);
            translate([1,-15.5+x,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=10,r=3.1,$fn=30);

            translate([20,15.5+x,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70,r=1.6,$fn=30);
            translate([0,15.5+x,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=18,r2=1.55,r1=1.7,$fn=60);
            translate([1,15.5+x,-15.5]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=10,r=3.1,$fn=30);
        };


        // Material saving cutout
        translate([-10,12,12]) cube([60,42,42],center=true);
        translate([-25,10.5,-11]) rotate([45,0,0]) cube([60,10,10]);
        translate([-25,21,-11]) rotate([45,0,0]) cube([60,10,10]);

        // Material saving cutout
        translate([-10,41,-30.5]) rotate([45,0,0])  cube([60,42,42],center=true);
    }
}

// Motor shaft cutout
module x_end_motor_shaft_cutout(){
    union(){
        difference(){
            translate([0,32,30]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70,r=17,$fn=6);
            translate([-10,-17+32,30]) cube([60,2,10],center=true);
            translate([-10,-8+32,-15.5+30]) rotate([60,0,0]) cube([60,2,10],center=true);
            translate([-10,8+32,-15.5+30]) rotate([-60,0,0]) cube([60,2,10],center=true);
        }
        translate([-30,25.2,-11.8 +30]) rotate([0,90,0]) cylinder(h=30,r=3,$fn=30);
        translate([-30,19.05,30]) rotate([0,90,0]) cylinder(h=30,r=3.5,$fn=100);
    }
}

// Final part
module x_end_motor(){
    difference(){
        x_end_motor_base();
        x_end_motor_shaft_cutout();
        x_end_motor_holes();

        // Waste pocket
        translate([-15,7,6]) rotate([90,0,0]) cylinder(h=3.5,r=5,$fn=30);
        translate([-15,7,51]) rotate([90,0,0]) cylinder(h=3.5,r=5,$fn=30);
        translate([-15,3.5,6]) rotate([90,0,0]) cylinder(h=3,r1=5,r2=4,$fn=30);
        translate([-15,3.5,51]) rotate([90,0,0]) cylinder(h=3,r1=5,r2=4,$fn=30);

        // Rod contact window
        translate([-17,3,55]) cube([4,4,10]);
        translate([-17,3,-8]) cube([4,4,10]);
        translate([-30,-30,58]) cube([30,30,10]);

        // Version
        translate([-23.2,-20,2]) rotate([90,0,270]) linear_extrude(height=0.6){
            text("R6",font="helvetica:style=Bold",size=4);
        }
    }

    translate([-15,10,6]) rotate([90,0,0]) cylinder(h=3,r=5,$fn=30);
    translate([-15,10,51]) rotate([90,0,0]) cylinder(h=3,r=5,$fn=30);

    // Bearing stop
    difference(){
        translate([0,0,57]) rotate([0,0,90]) cylinder(h=1,r=8,$fn=30);
        translate([0,0,56.9]) rotate([0,0,90]) cylinder(h=0.5,r1=8,r2=7,$fn=30);
        translate([0,0,56.5]) rotate([0,0,90]) cylinder(h=2,r=7,$fn=30);
        translate([-0.18,-0.5,50]) rotate([0,0,-40]) cube([12,1,10]);
    }

    // Bearings spacer
    rotate([0,0,45]) difference(){
        translate([0,0,26]) rotate([0,0,90]) cylinder( h=6,r=8,$fn=30);
        translate([0,0,25]) rotate([0,0,90]) cylinder( h=8,r=7.55,$fn=60);
        translate([0,0,25.9]) rotate([0,0,90]) cylinder( h=2,r2=7.5,r1=7.7,$fn=30);
        translate([0,0,31.4]) rotate([0,0,90]) cylinder( h=2,r1=7.5,r2=8.3,$fn=30);

        rotate([0,0,310]) translate([-2.5,0,26]) cube([5,15,10]);
        rotate([0,0,310-120]) translate([-2.5,0,26]) cube([5,15,10]);
        rotate([0,0,310-240]) translate([-2.5,0,26]) cube([5,15,10]);
    }

    // Nut trap print suports
    translate([-5.8,-13.149,13.5]) rotate([0,0,45]) cube([10,2.1,1],center=true);
    translate([-9.8,-11,13.7]) rotate([0,0,135]) cube([8,2.1,0.4],center=true);

    translate([-5.2,-8,13.7]) rotate([0,0,135]) cube([8,2.1,0.4],center=true);
    translate([-8.8,-8.55,13.5]) rotate([0,0,45]) cube([8,2.1,1],center=true);
}

difference(){
    union(){
        x_end_motor();
        translate([-8,-17,13.0]) rotate([0,0,44.7]) cube([10,1.5,1]);

        // belt tensioner body
        translate([-24,9,30.25]) rotate([90,30,0]) cylinder(h=27,r=4,$fn=6);
        difference(){
            translate([-30,9-27,30.25]) rotate([0,45,0]) cube([11,27,11]);
            translate([-37.465,9-27-1,20]) cube([10,30,21]);
            translate([-29,9-27-1,35]) cube([10,30,21]);
            translate([-20,9-27-1,20]) cube([25,30,21]);
        }
        difference(){
            translate([-24,-18,30.25]) rotate([90,0,0]) cylinder(h=10.5,r=5,$fn=30);
            translate([-24-19.5,-18,20]) rotate([90,0,0]) cube([20,20,20]);
        }
    }

    translate([-47,-40,60]) rotate([0,45,0]) cube([20,80,20]);
    translate([-20,-30.5,69]) rotate([0,45,0]) cube([20,20,20]);
    translate([-25,-37,49]) rotate([45,0,0]) cube([30,20,20]);
    translate([-25,23.5,49]) rotate([45,0,0]) cube([30,20,20]);

    // Belt tensioner
    translate([0,32,30.25]){
        translate([-24,-15.5-2.5,0]) rotate([90,0,0]) cylinder(h=35,r=1.6,$fn=30);
        translate([-24,-15.5-4.5-30,0]) rotate([90,0,0]) cylinder(h=30,r=3.2,$fn=30);
        translate([-24-10+2.8,-29,0-2.8]) cube([10,2.1,5.6]);
    }
}
