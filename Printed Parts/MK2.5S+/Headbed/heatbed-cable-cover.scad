// PRUSA iteration4
// Heatbed cover MK2.5
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module cover(){
    difference(){

        // Base block
        translate([-18,0,0]) cube([36,36,9]);

        // Inner cut
        translate([-15,-0.5,-3]) cube([30,16,9]);
        translate([-15,15,-6]) cube([30,22,9]);

        // Inner edges
        translate([3.5,2,0]) rotate([0,0,0]) cube([10.5,15,6]);
        translate([-14,2,0]) rotate([0,0,0]) cube([10.5,15,6]);

        translate([2.5,15,0]) rotate([0,0,0]) cube([8,8,6]);
        translate([-10.5,15,0]) rotate([0,0,0]) cube([8,8,6]);

        translate([6.96,19.45,0]) rotate([0,0,45]) cube([5,10,6]);
        translate([-6.96,19.45,0]) rotate([0,0,45]) cube([10,5,6]);

        translate([3.96,18.45,0]) rotate([0,0,20]) cube([5,6,6]);
        translate([-3.96,18.45,0]) rotate([0,0,70]) cube([6,5,6]);

        // Cables cut
        translate([-0,36,3]) rotate([90,0,0]) cylinder(h=21,r=4,$fn=60);

        translate([2,14,-1]) rotate([0,0,10]) cube([8,13,6]);
        translate([-9.88,15.21,-1]) rotate([0,0,-10]) cube([8,13,6]);

        // Outer edges
        translate([-18.0,32,-1]) rotate([0,0,25]) cube([11,11,11]);
        translate([18,32,-1]) rotate([0,0,65]) cube([11,11,11]);

        // Screw holes for clip
        translate([-11,30,0]) cylinder(h=10,r=1.6,$fn=50);
        translate([11,30,0]) cylinder(h=10,r=1.6,$fn=50);

        // Screw clip entry
        translate([-11,30,8]) cylinder(h=4,r1=2.75,r2=5,$fn=50);
        translate([11,30,8]) cylinder(h=4,r1=2.75,r2=5,$fn=50);

        // Heatbed terminal screw pockets
        translate([8.5,7.5,0]) cylinder(h=8.6,r=3.25,$fn=50);
        translate([-8.5,7.5,0]) cylinder(h=8.6,r=3.25,$fn=50);

        // Clip screw with print supports
        difference(){
            union(){
                translate([-11,30,6.4]) cylinder(h=4,r=3.15,$fn=60);
                translate([11,30,6.4]) cylinder(h=4,r=3.15,$fn=60);
                translate([0,7.5,6.4]) cylinder(h=4,r=3.15,$fn=60);
            }
            translate([-9.4,4,0.9]) cube([18.8,40,5.7]);
            translate([-17.6,4,0.9]) cube([5,40,5.7]);
            translate([12.6,4,0.9]) cube([5,40,5.7]);
            translate([-22,9,0.9]) cube([44,19.4,6]);
            translate([-20,31.6,0.9]) cube([70,10,6]);
            translate([-5,-4.1,0.9]) cube([10,10,6]);
            translate([-5,9.1,0.9]) cube([10,10,6]);
        }

        // Heatbed screw entry
        translate([0,7.5,8]) cylinder(h=4,r1=2.75,r2=5,$fn=50);
        translate([0,7.5,3]) cylinder(h=4,r=1.6,$fn=50);

        // LED window
        translate([-2.5,-1,-4]) cube([5,3.5,10]);
        translate([-14,-4,-6]) rotate([0,0,45]) cube([5,5,10]);
        translate([14,-4,-6]) rotate([0,0,45]) cube([5,5,10]);

        // Edges
        translate([-20,-0,6.5]) rotate([45,0,0]) cube([40,5,5]);
        translate([-23.3,-1,9.7]) rotate([0,45,0]) cube([6,45,6]);
        translate([14.8,-1,9.7]) rotate([0,45,0]) cube([6,45,5]);
    }

    // Heatbed pcb support
    translate([-17,0,4]) cube([3,20,2]);
    translate([14,0,4]) cube([3,20,2]);
    translate([-17,0,4]) cube([14,2,2]);
    translate([3,0,4]) cube([14,2,2]);

    // Heatbed screw body
    difference(){
        translate([0,7.5,4]) rotate(90,v=[0,0,1]) cylinder(h=4,r=2.75,$fn=50);
        translate([0,7.5,6.3]) cylinder(h =4,r=2.76,$fn=50);
        translate([0,7.5,3]) cylinder(h=4,r=1.6,$fn=50);
    }
}

module clip(){
    difference(){

        // Base body
        translate([-15,15.5,-3]) cube([30,20.5,6]);

        // Inner angled cut
        translate([3.5,2,0]) rotate([0,0,0]) cube([10.5,15,6]);
        translate([-14,2,0]) rotate([0,0,0]) cube([10.5,15,6]);

        translate([3.5,15,0]) rotate([0,0,0]) cube([7,8,6]);
        translate([-10.5,15,0]) rotate([0,0,0]) cube([7,8,6]);

        translate([6.96,19.45,1]) rotate([0,0,45]) cube([5,10,6]);
        translate([-6.96,19.45,1]) rotate([0,0,45]) cube([10,5,6]);

        translate([-7,15,0]) rotate([0,0,0]) cube([14,11,6]);

        translate([3,14,1]) rotate([0,0,10]) cube([7,13,6]);
        translate([-9.88,15.21,1]) rotate([0,0,-10]) cube([7,13,6]);

        // Cables cut
        translate([-0,36,3]) rotate([90,0,0]) cylinder(h=187,r=4,$fn=60);
        translate([-0,37,3]) rotate([90,0,0]) cylinder(h=17,r=3.5,$fn=60);

        // Nuts entry
        translate([-11,30,-3]) cylinder(h=10,r=1.6,$fn=50);
        translate([11,30,-3]) cylinder(h=10,r=1.6,$fn=50);
        translate([-11,30,-5.5]) rotate([0,0,30]) cylinder(h=3,r2=3.1,r1=5,$fn=6);
        translate([11,30,-5.5]) rotate([0,0,30]) cylinder(h=3,r2=3.1,r1=5,$fn=6);

        // Clip nuts with print supports
        difference(){
            union(){
                translate([-11,30,-3.4]) rotate([0,0,30]) cylinder(h=3,r=3.15,$fn=6);
                translate([11,30,-3.5]) rotate([0,0,30]) cylinder(h=3,r=3.15,$fn=6);
            }
            translate([-30,18.4,-0.9]) cube([60,10,2]);
            translate([-30,31.6,-0.9]) cube([60,10,2]);
            translate([-9.4,25,-1.1]) cube([18.8,10,2]);
            translate([-22.6,25,-1.1]) cube([10,10,2]);
            translate([12.6,25,-1.1]) cube([10,10,2]);
        }

        // Thermistor cable entry
        translate([-0,22,4]) rotate([115,0,0]) cylinder(h=15,r=3,$fn=60);

        // Edges
        translate([-18.0,32,-5]) rotate([0,0,25])  cube([11,11,15]);
        translate([18,32,-5]) rotate([0,0,65])  cube([11,11,15]);
    }

    // Cable rims
    difference(){
        difference(){
            translate([-0,36,3]) rotate([90,0,0]) cylinder(h=10,r=4.5,$fn=60);
            translate([-0,37,3]) rotate([90,0,0]) cylinder(h=17,r=3.5,$fn=60);
        }
        translate([-15,18,3]) cube([30,20,6]);
        translate([-15,27,-5]) cube([30,2,16]);
        translate([-15,30,-5]) cube([30,2,16]);
        translate([-15,33,-5]) cube([30,2,16]);
        translate([6.96,19.45,1]) rotate([0,0,45]) cube([5,10,6]);
        translate([-6.96,19.45,1]) rotate([0,0,45]) cube([10,5,6]);
        translate([-4,20,0]) rotate([0,0,0]) cube([8,11,6]);
    }

}

translate([0,40,3]) clip();
translate([0,40,9]) rotate([180,0,0]) cover();

