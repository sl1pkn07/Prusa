// PRUSA iteration4
// RaspberryPi Cover
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module raspberry_cover(){
    // Holders
    difference(){
        union(){
            translate([11.5,42.5,0]) cube([2,4,3.5]);
            translate([11.5,63.5,0]) cube([2,4,3.5]);
            translate([81.5,42.5,0]) cube([2,4,2.5]);
            translate([81.5,63.5,0]) cube([2,4,2.5]);

            translate([10.4,42.5,2.7]) rotate([0,45,0]) cube([2,4,2]);
            translate([10.4,63.5,2.7]) rotate([0,45,0]) cube([2,4,2]);
            translate([81.7,42.5,1.7]) rotate([0,45,0]) cube([2,4,2]);
            translate([81.7,63.5,1.7]) rotate([0,45,0]) cube([2,4,2]);
        }
        translate([10.5,42,3.5]) cube([4,5,3.5]);
        translate([10.5,63,3.5]) cube([4,5,3.5]);
        translate([81.5,42,2.5]) cube([4,5,2.5]);
        translate([81.5,63,2.5]) cube([4,5,2.5]);
    }

    // Body
    difference(){
        translate([11.5,36,-3]) cube([72,38,3]);

        translate([-0.4,-0.4,0]) difference(){
            translate([17.5,42,-4.1]) cylinder(h=4.2,r=8,$fn=40);
            translate([17.5,42,-4]) cylinder(h=4,r=5.6,$fn=40);

            translate([11.9,42,-4]) cube([14,8,4]);
            translate([17.5,36.4,-4]) cube([8,6,4]);
        }
        translate([60.4,-0.4,0]) difference(){
            translate([17.5,42,-4.1]) cylinder(h=4.2,r=8,$fn=40);
            translate([17.5,42,-4]) cylinder(h=4,r=5.6,$fn=40);

            translate([9.1,42,-4]) cube([14,8,4]);
            translate([9.5,36.4,-4]) cube([8,6,4]);
        }
        translate([60.4,26.4,0]) difference(){
            translate([17.5,42,-4.1]) cylinder(h=4.2,r=8,$fn=40);
            translate([17.5,42,-4]) cylinder(h=4,r=5.6,$fn=40);

            translate([8.5,33.6,-4]) cube([9,14,4]);
            translate([17.1,34,-4]) cube([6,8,4]);
        }

        translate([-0.4,26.4,0]) difference(){
            translate([17.5,42,-4.1]) cylinder(h=4.2,r=8,$fn=40);
            translate([17.5,42,-4]) cylinder(h=4,r=5.6,$fn=40);

            translate([17.5,33.6,-4]) cube([9,14,4]);
            translate([11.9,33.4,-4]) cube([6,9,4]);
        }

        // Ventilation cutout
        for (i=[-5:6]){
            translate([43+(i*5.5),42.3,-5]) cube([3.65,25.2,10]);
        }

        // Raspberry pcb cutout
        translate ([0,0,-2]) difference(){
            translate([13.5,38,0]) cube([68,34,9]);

            translate([0,0,0]) difference(){
                translate([17.5,42,-1.1]) cylinder(h=9.2,r=8,$fn=40);
                translate([17.5,42,-1]) cylinder(h=9,r=4,$fn=40);

                translate([13.5,42,-1]) cube([12,8,9]);
                translate([17.5,38,-1]) cube([8,5,9]);
            }
            translate([60,0,0]) difference(){
                translate([17.5,42,-1.1]) cylinder(h=9.2,r=8,$fn=40);
                translate([17.5,42,-1]) cylinder(h=9,r=4,$fn=40);

                translate([9.5,42,-1]) cube([12,8,9]);
                translate([9.5,38,-1]) cube([8,5,9]);

            }
            translate([60,26,0]) difference(){
                translate([17.5,42,-1.1]) cylinder(h=9.2,r=8,$fn=40);
                translate([17.5,42,-1]) cylinder(h=9,r=4,$fn=40);

                translate([9.5,34,-1]) cube([8,12,9]);
                translate([17.5,34,-1]) cube([4,8,9]);
            }

            translate([0,26,0]) difference(){
                translate([17.5,42,-1.1]) cylinder(h=9.2,r=8,$fn=40);
                translate([17.5,42,-1]) cylinder(h=9,r=4,$fn=40);

                translate([17.5,34,-1]) cube([8,12,9]);
                translate([13.5,34,-1]) cube([5,8,9]);
            }
        }
    }
}

raspberry_cover();
