

do_rocket_part_lander = false ;
do_rocket_part_body = false ;

do_rocket_level_1_part_1 = false ;
do_rocket_level_1_part_2 = false ;
do_rocket_level_1_part_3 = false ;
do_rocket_level_1_part_4 = false ;
do_rocket_level_1_part_5 = false ;
do_rocket_level_1_part_6 = false ;

do_rocket_level_2_part_1 = false ;
do_rocket_level_2_part_2 = false ;
do_rocket_level_2_part_3 = false ;
do_rocket_level_2_part_4 = false ;
do_rocket_level_2_part_5 = false ;
do_rocket_level_2_part_6 = false ;

do_rocket_level_3_part_1 = false ;
do_rocket_level_3_part_2 = false ;
do_rocket_level_3_part_3 = false ;
do_rocket_level_3_part_4 = false ;
do_rocket_level_3_part_5 = false ;
do_rocket_level_3_part_6 = false ;

do_rocket_level_4_part_1 = false;
do_rocket_level_4_part_2 = false;
do_rocket_level_4_part_3 = false ;
do_rocket_level_4_part_4 = false;
do_rocket_level_4_part_5 = false;
do_rocket_level_4_part_6 = false ;

do_rocket_level_5_part_1 = false ;
do_rocket_level_5_part_2 = false ;
do_rocket_level_5_part_3 = false ;
do_rocket_level_5_part_4 = false ;
do_rocket_level_5_part_5 = false ;
do_rocket_level_5_part_6 = false ;

do_rocket_part_capsule  = false ;

/* [Hidden] */
$fn=100;

rocket_d = 43.45 ;
rocket_h = 330;

rocket_shift_translate_z = 20 ;

noze_h = 68 ;
nozzle_h = 42 ;

module rocket() {
    hull() {
        difference() {
            scale([1,1,rocket_h/rocket_d]) {
                sphere(d=rocket_d);
            }
            translate([-nozzle_h/2,-nozzle_h/2,-rocket_h/2]) {
                cube(nozzle_h);
            }
            translate([-noze_h/2,-noze_h/2,rocket_h/2-noze_h]) {
                cube(noze_h);
            }
        }
        translate([0,0,rocket_h/2-noze_h+10]) {
            cylinder(h=noze_h,r1=12.6,r2=0);
        }
    }
}

sphere_foot_d = 34;
sphere_foot_h = 16;

cone_foot_base_d = 36;
cone_foot_base_h = 100 - sphere_foot_h;

module rocket_foot() {
    translate([0,0,sphere_foot_d/2]) {
        hull() {
            difference() {
                scale([1,1,1.5*cone_foot_base_h/cone_foot_base_d]) {
                    sphere(d=cone_foot_base_d);
                }
                translate([0,0,-2*cone_foot_base_d]) {
                    cube([cone_foot_base_d,cone_foot_base_d,4*cone_foot_base_d],center=true);
                }
            }
            translate([0,0,20]) {
                cylinder(h=(1.5*cone_foot_base_h/cone_foot_base_d)*sphere_foot_h,r1=12.6,r2=0);
            }
        }
        sphere(d=sphere_foot_d);
    }
}

p1 = [-cone_foot_base_d/2+1, sphere_foot_d/2+1.5] ;
p2 = [0, sphere_foot_d/2+1.5] ;
p3 = [0, sphere_foot_d/2+20+(1.5*cone_foot_base_h/cone_foot_base_d)*sphere_foot_h] ;
p4 = [-7.48, 99.92] ;
p5 = [-14.96, 110.5] ;
p6 = [-23.11, 120.6] ;
p7 = [-31.92, 130.2] ;
p8 = [-41.34, 139.1] ;
p9 = [-51.34, 147.4] ;
p10 = [-60.93, 154.4] ;
p10p = [-70.93, 161.4] ;

p11p = [-77.34, 81] ;
p11 = [-67.34, 76.65] ;
p12 = [-59, 71.8] ;
p13 = [-50.8, 65.86] ;
p14 = [-43.25, 59.12] ;
p15 = [-36.42, 51.64] ;
p16 = [-30.39, 43.51] ;
p17 = [-25.22, 34.8] ;
p18 = [-20.97, 25.62] ;

v_points_1 = [
    p1 , // 1
    p18, // 2
    p17, // 3
    p16, // 4
    p15, // 5
    p14, // 6
    p13, // 7
    p12, // 8
    p11, // 9
    p11p
] ;

v_points_2 = [
    p2 , // 1 
    p1 , // 2
    p18, // 3
    p17, // 4
    p16, // 5
    p15, // 6 
    p14, // 7
    p13, // 8
    p12, // 9
    p11
] ;

v_points_3 = [
    p3, // 1
    p4, // 2
    p4, // 3
    p4, // 4
    p5, // 5
    p6, // 6
    p7, // 7
    p8, // 8
    p9, // 9
    p10
] ;

v_points_4 = [
    p4, // 1
    p5, // 2
    p5, // 3
    p5, // 4
    p6, // 5
    p7, // 6
    p8, // 7
    p9, // 8
    p10, // 9
    p10p
] ;

v_points = [
    p1 ,
    p2 ,
    p3,
    p4,
    p5,
    p6,
    p7,
    p8,
    p9,
    p10,

    p11,
    p12,
    p13,
    p14,
    p15,
    p16,
    p17,
    p18
] ;

module rocket_leg_v2() {
    for( indexOfPoint = [0: len(v_points_1)-1] ) {
        hull() {
            point1 = v_points_1[indexOfPoint];
            translate([point1[0]-0.5, 0, point1[1]-0.5]) {
                rotate([45,0,0]) {
                    cube(1,center=true);
                }
            }

            point2 = v_points_2[indexOfPoint];
            translate([point2[0]-0.5, 0, point2[1]-0.5]) {
                rotate([45,0,0]) {
                    cube(1,center=true);
                }
            }

            point3 = v_points_3[indexOfPoint];
            translate([point3[0]-0.5, 0, point3[1]-0.5]) {
                rotate([45,0,0]) {
                    cube(1,center=true);
                }
            }

            point4 = v_points_4[indexOfPoint];
            translate([point4[0]-0.5, 0, point4[1]-0.5]) {
                rotate([45,0,0]) {
                    cube(1,center=true);
                }
            }
        }
    }
    hull() {
        translate([p3[0]-0.5, 0, p3[1]-0.5]) {
            rotate([45,0,0]) {
                cube(1,center=true);
            }
        }
        translate([p4[0]-0.5, 0, p4[1]-0.5]) {
            rotate([45,0,0]) {
                cube(1,center=true);
            }
        }
        translate([p5[0]-0.5, 0, p5[1]-0.5]) {
            rotate([45,0,0]) {
                cube(1,center=true);
            }
        }
    }
}

module rocket_lander() {
    union() {
        rocket_foot();
        rocket_leg_v2();
    }
}

x_lander_1 = -39.84;
y_lander_1 = 69 ;
alpha_lander_1 = 120 ;

x_lander_2 = -39.84 ;
y_lander_2 = -69 ;
alpha_lander_2 = -120 ;

x_lander_3 = 119.51-39.84 ;
y_lander_3 = 0 ;
alpha_lander_3 = 0 ;

module three_feets() {
    translate([x_lander_1,y_lander_1,0]) {
        rotate([0,0,alpha_lander_1]) {
            rocket_lander();
        }
    }

    translate([x_lander_2,y_lander_2,0]) {
        rotate([0,0,alpha_lander_2]) {
            rocket_lander();
        }
    }

    translate([x_lander_3,y_lander_3,0]) {
        rotate([0,0,alpha_lander_3]) {
            rocket_lander();
        }
    }
}

z_base_body = p10[1]-2;
z_top_body  = rocket_h-noze_h+20 ;
cube_h = (z_top_body - z_base_body)/5 ;

module rocket_full() {
    union() {
        three_feets();
        translate([0,0,rocket_h/2+rocket_shift_translate_z]) {
            rocket();
        }
    }
}

module rocket_part_lander() {
    difference() {
        union() {
            three_feets();
            translate([0,0,rocket_h/2+rocket_shift_translate_z]) {
                rocket();
            }
        }
        translate([0,0,z_base_body]) {
            translate([0,0,10*cube_h/2]) {
                cube_w_1 = cube_h-4 ;
                cube([4*cube_w_1,4*cube_h,10*cube_h],center=true);
            }
        }
    }
}

module rocket_part_body() {
    cube_w_1 = cube_h ;
    difference() {
        difference(){
            translate([0,0,rocket_h/2+rocket_shift_translate_z]) {
                scale([0.9,0.9,1]) {
                    rocket();
                }
            }
            translate([0,0,z_base_body]) {
                translate([0,0,-10*cube_h/2]) {
                    cube([10*cube_w_1,10*cube_h,10*cube_h],center=true);
                }
            }
        }
        translate([0,0,z_base_body+5*cube_w_1+4*cube_h/2]) {
            cube([10*cube_w_1,10*cube_h,4*cube_h],center=true);
        }
    }
}

module rocket_part_capsule() {
    cube_w_1 = cube_h ;
    intersection() {
        difference(){
            translate([0,0,rocket_h/2+rocket_shift_translate_z]) {
                rocket();
            }
            translate([0,0,z_base_body]) {
                translate([0,0,-10*cube_h/2]) {
                    cube([10*cube_w_1,10*cube_h,10*cube_h],center=true);
                }
            }
        }
        translate([0,0,z_base_body+5*cube_w_1+4*cube_h/2]) {
            cube([10*cube_w_1,10*cube_h,4*cube_h],center=true);
        }
    }
}


module draw_part(alpha,z) {
    s=rocket_d;
    rotate([0,0,alpha]) {
        difference() {
            difference() {
                translate([0,0,rocket_h/2+rocket_shift_translate_z]) {
                    rocket();
                }
                translate([0,0,z_base_body]) {
                    translate([0,0,z*cube_h]) {
                        cylinder(h=rocket_h,r=rocket_d);
                    }
                    translate([0,0,(z-1)*cube_h]) {
                        rotate([180,0,0]) {
                            cylinder(h=rocket_h,r=rocket_d);
                        }
                    }
                }
                scale([0.9,0.9,1]) {
                    translate([0,0,rocket_h/2+rocket_shift_translate_z]) {
                        rocket();
                    }
                }
            }

            union() {
                translate([-s/2,0,z_base_body+cube_h/2]) {
                        cube([s,2*rocket_d,rocket_h*2],center=true);
                }
                translate([0,0,z_base_body+cube_h/2]) {
                    rotate([0,0,-180/3]) {
                        translate([s/2,s/2,0]) {
                            cube([s,2*rocket_d,rocket_h*2],center=true);
                        }
                    }
                }
            }
        }
    }
}

if ( do_rocket_part_lander ) {
    rocket_part_lander() ;
}

if ( do_rocket_part_body ) {
    rocket_part_body();
}


//---
//   level 1
if ( do_rocket_level_1_part_1 ) {
    draw_part(0,1);
}

if ( do_rocket_level_1_part_2 ) {
    draw_part(180/3,1);
}

if ( do_rocket_level_1_part_3 ) {
    draw_part(2*180/3,1);
}

if ( do_rocket_level_1_part_4 ) {
    draw_part(3*180/3,1);
}

if ( do_rocket_level_1_part_5 ) {
    draw_part(4*180/3,1);
}

if ( do_rocket_level_1_part_6 ) {
    draw_part(5*180/3,1);
}
//   level 1
//---


//---
//   level 2
if ( do_rocket_level_2_part_1 ) {
    draw_part(0,2);
}

if ( do_rocket_level_2_part_2 ) {
    draw_part(180/3,2);
}

if ( do_rocket_level_2_part_3 ) {
    draw_part(2*180/3,2);
}

if ( do_rocket_level_2_part_4 ) {
    draw_part(3*180/3,2);
}

if ( do_rocket_level_2_part_5 ) {
    draw_part(4*180/3,2);
}

if ( do_rocket_level_2_part_6 ) {
    draw_part(5*180/3,2);
}
//   level 2
//---


//---
//   level 3
if ( do_rocket_level_3_part_1 ) {
    draw_part(0,3);
}

if ( do_rocket_level_3_part_2 ) {
    draw_part(180/3,3);
}

if ( do_rocket_level_3_part_3 ) {
    draw_part(2*180/3,3);
}

if ( do_rocket_level_3_part_4 ) {
    draw_part(3*180/3,3);
}

if ( do_rocket_level_3_part_5 ) {
    draw_part(4*180/3,3);
}

if ( do_rocket_level_3_part_6 ) {
    draw_part(5*180/3,3);
}
//   level 3
//---


//---
//   level 4
if ( do_rocket_level_4_part_1 ) {
    draw_part(0,4);
}

if ( do_rocket_level_4_part_2 ) {
    draw_part(180/3,4);
}

if ( do_rocket_level_4_part_3 ) {
    draw_part(2*180/3,4);
}

if ( do_rocket_level_4_part_4 ) {
    draw_part(3*180/3,4);
}

if ( do_rocket_level_4_part_5 ) {
    draw_part(4*180/3,4);
}

if ( do_rocket_level_4_part_6 ) {
    draw_part(5*180/3,4);
}
//   level 4
//---


//---
//   level 5
if ( do_rocket_level_5_part_1 ) {
    draw_part(0,5);
}

if ( do_rocket_level_5_part_2 ) {
    draw_part(180/3,5);
}

if ( do_rocket_level_5_part_3 ) {
    draw_part(2*180/3,5);
}

if ( do_rocket_level_5_part_4 ) {
    draw_part(3*180/3,5);
}

if ( do_rocket_level_5_part_5 ) {
    draw_part(4*180/3,5);
}

if ( do_rocket_level_5_part_6 ) {
    draw_part(5*180/3,5);
}
//   level 5
//---

if ( do_rocket_part_capsule ) {
    rocket_part_capsule();
}

