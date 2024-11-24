// PRUSA iteration3
// PSU Cover
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// 2016-11-06 customized by MilanNXT
// 2016dec05 - fiveangle@gmail.com - fixed minor errors by MilanNXT (accidentially had degree 2-degree offset in NEMA-15
//             socket relocation, causing issue with interface of PSU shelf cutout + nut trap length
//           - relocated NEMA socket to far left corner to prevent conflict with PSU mains crimp connections (MilanNXT
//             version had centered, so required removing crimp lugs and twisting bare wires into PSU - see comments on
//             my make of his design: http://www.thingiverse.com/make:272849
//           - re-oriented switch to normal up-on/down-off configuration instead of forward-backward
//           - fixed switch height hole size too big (present in original Prusa design files)
//           - disabled ridge cuts and badge elements (see "fiveangle" comments below to uncomment if you want to enable them)



cover_height =  2.00; // additinal height to original (0 for original size)
socket_pos   =  2;    // 1 = original position on side
                      // 2 = position on back
socket_type  =  1;    // 1 = single - small (original)
                      // 2 = combined with switch - larger

module CubeAdjust(Xdim, Zdim){
    for (x =[6:11.2:Xdim-12]){
        for (z =[6:11.2:Zdim-12]){
            translate([x,-0.2,z]) cube([10,0.4,10]);
        }
    }
}

module socket_cutout1(){
    translate([45,2,40])cube([27.5,31.9,30]); // socket cutout
    translate([45-4.5,2+15.6,40]) cylinder(r=2,h=50,$fn=8); // socket right hole cutout
    translate([45-4.5+37-0.5,2+15.6,40]) cylinder(r=2,h=50,$fn=8); // socket left hole cutout
    translate([45-4.5+37-0.5,2+15.6,40]) cylinder(r=3.25,h=15-1.5,$fn=6); // socket right hole cutout nuttrap
    translate([45-4.5,2+15.6,40]) cylinder(r=3.25,h=15-1.5,$fn=6); // socket left hole cutout nuttrap
}

module socket_cutout2(){
    translate([45,-13,40]) cube([27.5,47,30]); // socket cutout
    translate([45-4.5,2+15.6-7.5,40]) cylinder(r=2,h=50, $fn=8); // socket right hole cutout
    translate([45-4.5+37-0.5,2+15.6-7.5,40]) cylinder(r=2,h=50,$fn=8); // socket left hole cutout
    translate([45-4.5+37-0.5,2+15.6-7.5,40]) cylinder(r=3.25,h=15-1.5,$fn=6); // socket right hole cutout nuttrap
    translate([45-4.5,2+15.6-7.5,40]) cylinder(r=3.25,h=15-1.5,$fn=6); // socket left hole cutout nuttrap
}

module switch_cutout(){
    translate([5,3,44] )cube([20,13.5,30]);
}

module PSU_COVER(){
    difference(){
        union(){
    
            translate([0,-cover_height,-1]) cube([95,50+15+cover_height,56]); // Base

            translate([0,0-cover_height,-3.5]) cube([14-0.5,50+15+cover_height,5]); // Back pillar 1

            translate([60-0.5,0,-3.5]) cube([14,50+15,5]); // Back pillar 2

            translate([91+4,0-cover_height,-1]) cube([6,50+15+cover_height,56]); // Base for bracket

            translate([-2,45.4-4.6,19])cube([2,3,15]); // nipple on the right

            translate([-1.6,0-cover_height,0]) cube([1.65,65+cover_height,2]); // Frame skirt 1
            translate([-1.6,0-cover_height,0]) cube([1.65,30+cover_height,55]); // Frame skirt 2
            translate([-1.6,0-cover_height,51]) cube([1.65,65+cover_height,4]); // Frame skirt 3
        }
        
        // pretty corners
        translate([-11,-2-cover_height,-2]) rotate([0,0,-45]) cube([10,10,58]);
        translate([95-3+5+1,-2-cover_height,-2]) rotate([0,0,-45]) cube([10,10,58]);

        translate([-3,-9-cover_height,-5]) rotate([-45,0,0]) cube([130,10,10]);
        translate([-3,-12-cover_height,56]) rotate([-45,0,0]) cube([130,10,10]);

        translate([-3,45+15,-5]) rotate([-45,0,0]) cube([130,10,10]);
        translate([-3,48+15,56]) rotate([-45,0,0]) cube([130,10,10]);
        translate([95-3+3,70,-2]) rotate([0,0,-45]) cube([10,10,58]);

        translate([95,0-10-cover_height,-20]) rotate([0,-45,-45]) cube([20,20,20]);
        translate([95,0-10-cover_height,45]) rotate([0,-45,-45]) cube([20,20,20]);

        translate([95,60,-10]) rotate([-35,-45,-45]) cube([20,20,20]);
        translate([95,60,65]) rotate([-55,48,-48]) cube([20,20,20]);

        translate([79,-5-cover_height,68.5]) rotate([0,45,0]) cube([20,90+cover_height,20]);
        translate([79,4-cover_height,-14.5]) rotate([0,45,0]) cube([20,90+cover_height,20]);

        translate([-14,-5-cover_height,68.5]) rotate([0,45,0]) cube([20,90+cover_height,20]);

        translate([3,2-cover_height,2]) cube([89.02,50.02+15+cover_height,50.02-0.7]); // main cutout

        translate([-3,50-16.4+15,2])cube([100,16.5,50-0.7]); // insert cutout

        translate([-3,50-16.4-15.6+15,2])cube([10,100,17]); // right bottom cutout

        translate([85+2,50-16.4-17.6+15+0.9,2])cube([10,100,50-0.7]); // left bottom cutout

        translate([-3,50-16.4-17.6+15+0.9,2])cube([100,100,10]); //  bottom cutout

        if (socket_pos == 1){
            translate([5.5,0,0]) 
            if(socket_type == 1) socket_cutout1();
            else 
            if(socket_type == 2) socket_cutout2();
        }
        else
        if (socket_pos == 2){
            rotate([0,90,0]) translate([-90.8, -1.99,46])
            if(socket_type == 1) socket_cutout1();
            else
            if(socket_type == 2) socket_cutout2();
        }

        if (socket_type == 1) translate([5.5,0,0]) switch_cutout();

        translate([7-0.5-0.5,40-1+15+0.7,-10]) cylinder(r=2,h=50,$fn=15); // left back mounthole cutout
        translate([7-0.5-0.5,40-1+15+0.7,-3.7]) cylinder(r2=2,r1=3.5,h=1.5,$fn=15);

        translate([67.5-0.7-0.5,43.5-1+15+0.5,-10]) cylinder(r=2,h=50,$fn=15); // right back mounthole cutout
        translate([67.5-0.7-0.5,43.5-1+15+0.5,-3.7]) cylinder(r2=2,r1=3.5,h=1.5,$fn=15);

        translate([130,32+26,55-4-25]) rotate([0,-90,0]) cylinder(r=2.5,h=50,$fn=35); // Left side bracket screw hole
        translate([101.1,32+26,55-4-25])rotate([0,-90,0]) cylinder(r2=2.5,r1=4.1,h=3,$fn=15);

        for(i=[0:10]){
            translate([20+i,6,-10]) cylinder(r=3,h=50); // left back mounthole cutout
        }

        translate([-0.3,0-cover_height,-2.2]) CubeAdjust(102,53.25);
    }
}

module PSU_Y_REINFORCEMENT(){
    difference(){
        union(){ // base shape
            translate([59.5,0,-18]) cube([33,6,19]); // reinforcement plate
            translate([73.5,5,-18]) cube([5,16,019]); // vertical_reinforcement    
        }
        union(){ // cutouts
            translate([87.5,-8,-20]) rotate([0,45,0]) cube([10,20,10]); // corner cut
            translate([52.5,-8,-20]) rotate([0,45,0]) cube([10,20,10]); // corner cut
            translate([68.5,20,-34]) rotate([45,0,0]) cube([15,23,20]); // vertical reinf cutout
            
            translate([88,8,-11.5]) rotate([90,0,0]) cylinder(h=10,r=1.8,$fn=30); // hole A
            translate([68,8,-11.5]) rotate([90,0,0]) cylinder(h=10,r=1.8,$fn=30); // hole B
            
            translate([88,8,-9.5]) rotate([90,0,0]) cylinder(h=10,r=1.8,$fn=30); // hole A
            translate([68,8,-9.5]) rotate([90,0,0]) cylinder(h=10,r=1.8,$fn=30); // hole B
            
            translate([86.2,-10,-11.5]) cube([3.6,20,2]); // hole cut extension
            translate([66.2,-10,-11.5]) cube([3.6,20,2]); // hole cut extension
        }
    }
}

module FINAL_PART(){
  rotate([90,0,0])  
  union(){
        PSU_COVER();
        PSU_Y_REINFORCEMENT();
    }   
}

FINAL_PART();
