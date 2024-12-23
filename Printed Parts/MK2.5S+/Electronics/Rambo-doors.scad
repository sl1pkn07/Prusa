// PRUSA iteration4
// RAMBo doors
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module body(){
    // Side panels
    cube([105.5,87.5,1.5]);
    cube([105.5,2,18]);
    cube([2,89.5,18]);

    // Corner reinforcement
    translate([98,1,0]) cube([7.5,5,18]);
    translate([0.5,0.5,0]) cube([5,6.5,18]);
    translate([1,0,0]) cube([10,87.5,6]);
    translate([99.5,0,0]) cube([6,87.5,7]);
    translate([10,0,0]) cube([6,5,6]);

    // Screw thread body
    translate([54,2,0]) cube([9.5,6,18]);

    // Rounded side
    translate([0,87.5,4.5]) rotate([0,90,0]) cylinder(h=105.5,r=4.5,$fn=30);

    // Upper hinge reinforcement
    translate([0.5,69,-9]) rotate([20,0,0]) cube([26,20,10]);

    // Door closing
    translate([4,3.5,14.8]) cylinder(h=3.2,r1=1.8,r2=3.5,$fn=30);
    translate([102,3.5,14.8]) cylinder(h=3.2,r1=1.8,r2=3.5,$fn=30);
}

module ventilation_holes(){
    for (i=[0:9]){
        translate([40+(i*6),10.5,-1]) cube([3.65,19+50,1.2]);
        translate([40+(i*6),10.5,-1]) cube([3.65,19,10]);
        translate([40+(i*6),10.5+25,-1]) cube([3.65,19,10]);
        translate([40+(i*6),10.5+50,-1]) cube([3.65,19,10]);
    }
    for (i=[-4:0]){
        translate([40+(i*6),10.5,-1]) cube([3.65,19+50,1.2]);
    }
    for (i=[-7:-6]){
        translate([46+(i*6),20.5,-1]) cube([3.65,19+40,1.2]);
    }
    translate([15,10,1]) cube([20,55,1.5]);
}

module cutouts(){
    // Door closing screw
    translate([58.5,4,1]) cylinder(h=18,r=1.8,$fn=30);
    translate([58.5,4,14.5]) cylinder(h=2.6,r1=1.8,r2=2.2,$fn=30);
    translate([58.5,4,11.5] ){
        translate([0,0,2.5]) cube([5.7,3.8,1],center=true);
        translate([0,0,3]) cube([3.8,3.8,1],center=true);
    }

    ventilation_holes();

    // Rounded side cutoff
    translate([26.5,87.5,4.5]) rotate([0,90,0]) cylinder(h=73,r=3.5,$fn=30);
    translate([26.5,80,5]) cube([73,19,10]);
    translate([26.5,82.5,1]) cube([73,5,10]);

    // Upper hinge cut
    translate([0,60,-10]) cube([30,30,10]);
    translate([-1,80,-1]) rotate([-45,0,0]) cube([22.5,8,18]);

    // Upper hinge
    translate([2,80,6] ) cube([19.5,10,10]);
    translate([-2,88,5] ) rotate([50,0,0]) cube([19.5,10,5]);
    translate([-5,87.5,4.5]) rotate([0,90,0]) cylinder(h=26.5,r=2.5,$fn=30);
    translate([-5,87.5,4.5]) rotate([0,90,0]) cylinder(h=26.5,r=5,$fn=30);

    // Hinge hole
    translate([-5,87.5,4.5]) rotate([0,90,0]) cylinder(h=120,r=2.6,$fn=30);

    // Door closing
    translate([4,3.5,14.9]) cylinder(h=3.2,r1=1.2,r2=2.8,$fn=30);
    translate([102,3.5,14.9]) cylinder(h=3.2,r1=1.2,r2=2.8,$fn=30);

    // M3 NUT
    translate( [55.65,0.5,12] ) cube([5.7,10,2.2]);

    // Side panel lightning slot
    translate( [2,10,3] ) cube([7,65,5]);
    translate( [101,10,3] ) cube([3,70,5]);

    // Corners - cut
    translate( [53,3,1.5] ) rotate([0,0,70]) cube([10,10,50]);
    translate( [61,12,1.5] ) rotate([0,0,-70]) cube([10,10,50]);
    translate( [16,2,1.5] ) rotate([0,0,45]) cube([5,5,50]);
}

module RAMBo_doors(){
    difference(){
        body();
        cutouts();
        // Large corner cut
        translate( [0,-20,-3] ) rotate([0,45,45]) cube([30,30,20]);

        translate([30,79,1]) rotate([0,0,-90]) linear_extrude(height=0.8){
            text("R1",font="helvetica:style=Bold",size=6);
        }
    }
}

RAMBo_doors();
