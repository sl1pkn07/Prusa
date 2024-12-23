// PRUSA iteration3
// Y idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module y_idler_base(){
    translate([0,0,0]) cylinder(h=19,r=8);
    translate([0,20,0]) cylinder(h=19,r=8);
    translate([0,10,9.5]) cube([16,20,19],center=true);
    translate([-4,10,9.5]) cube([8,16+20,19],center=true);
}

module y_idler_holes(){
    translate([0,0,-1]) cylinder(h=120,r=1.8);
    translate([0,20,-1]) cylinder(h=25,r=4.5);
    translate([0,0,4]) cylinder(h=11,r=12);
}

// Final part
module y_idler(){
    translate([0,0,8]) rotate([0,-90,0]) difference(){
        y_idler_base();
        y_idler_holes();
    }
}

y_idler();
