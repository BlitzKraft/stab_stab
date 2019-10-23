// Stab hole - Change width to 7 for the smaller hole
width = 12.5;
//width = 7;
module plate_pcb() {
	translate([0, 0, 1.5]) {
		translate([0, 0, 3.5])
		translate([0, 0, 0.75])
		difference() {
			// Plate
			cube([30, 30, 1.5], center=true);

			// Stab hole
			cube([width, 13.5, 3], center=true);
		}

		//PCB
		translate([0, 0, -0.75])
		color("green")
		cube([30, 30, 1.5], center=true);
	}
}

/*/ costar
translate([-width/2, -13.5/2, 2.5])
color("black")
cube([3, 13.5, 8]);
*/

//plate_pcb();

//begin stab-stab
rotate([90, 0, 0]) // Rotate just to orient properly for 3D printing
difference() {
	plate_lip = 1;
	z_offset = 0.5;
	translate([plate_lip/2, 0, 4+z_offset])
	color("yellow")
	cube([width+plate_lip, 13, 5+z_offset], center=true);
	union() {
		plate_pcb();
		// costar
		translate([-width/2 + 3, -13.5/2, 2.5])
		color("black")
		cube([3, 13.5, 8]);
	}
}
