OPENSCAD = openscad
OPTS = -q -p parameters.json

STLLEVEL1 = rocket-level-1-part-1.stl rocket-level-1-part-2.stl rocket-level-1-part-3.stl rocket-level-1-part-4.stl rocket-level-1-part-5.stl rocket-level-1-part-6.stl
STLLEVEL2 = rocket-level-2-part-1.stl rocket-level-2-part-2.stl rocket-level-2-part-3.stl rocket-level-2-part-4.stl rocket-level-2-part-5.stl rocket-level-2-part-6.stl
STLLEVEL3 = rocket-level-3-part-1.stl rocket-level-3-part-2.stl rocket-level-3-part-3.stl rocket-level-3-part-4.stl rocket-level-3-part-5.stl rocket-level-3-part-6.stl
STLLEVEL4 = rocket-level-4-part-1.stl rocket-level-4-part-2.stl rocket-level-4-part-3.stl rocket-level-4-part-4.stl rocket-level-4-part-5.stl rocket-level-4-part-6.stl
STLLEVEL5 = rocket-level-5-part-1.stl rocket-level-5-part-2.stl rocket-level-5-part-3.stl rocket-level-5-part-4.stl rocket-level-5-part-5.stl rocket-level-5-part-6.stl
STLFILES =  rocket-part-body.stl rocket-part-capsule.stl rocket-part-lander.stl $(STLLEVEL1) $(STLLEVEL2) $(STLLEVEL3) $(STLLEVEL4) $(STLLEVEL5)

SCAD_TMP_LEVEL1 = rocket-level-1-part-1.scad rocket-level-1-part-2.scad rocket-level-1-part-3.scad rocket-level-1-part-4.scad rocket-level-1-part-5.scad rocket-level-1-part-6.scad
SCAD_TMP_LEVEL2 = rocket-level-2-part-1.scad rocket-level-2-part-2.scad rocket-level-2-part-3.scad rocket-level-2-part-4.scad rocket-level-2-part-5.scad rocket-level-2-part-6.scad
SCAD_TMP_LEVEL3 = rocket-level-3-part-1.scad rocket-level-3-part-2.scad rocket-level-3-part-3.scad rocket-level-3-part-4.scad rocket-level-3-part-5.scad rocket-level-3-part-6.scad
SCAD_TMP_LEVEL4 = rocket-level-4-part-1.scad rocket-level-4-part-2.scad rocket-level-4-part-3.scad rocket-level-4-part-4.scad rocket-level-4-part-5.scad rocket-level-4-part-6.scad
SCAD_TMP_LEVEL5 = rocket-level-5-part-1.scad rocket-level-5-part-2.scad rocket-level-5-part-3.scad rocket-level-5-part-4.scad rocket-level-5-part-5.scad rocket-level-5-part-6.scad
SCAD_TMP_FILES =  rocket-part-body.scad rocket-part-capsule.scad rocket-part-lander.scad $(SCAD_TMP_LEVEL1) $(SCAD_TMP_LEVEL2) $(SCAD_TMP_LEVEL3) $(SCAD_TMP_LEVEL4) $(SCAD_TMP_LEVEL5)

.SUFFIXES: .stl .scad

.scad.stl:
	$(OPENSCAD) -q -o "$@" -p parameters.json -P $(subst .stl,,$@)  "$<"

prepare: tintin-rocket.scad
	ln -s tintin-rocket.scad rocket-level-1-part-1.scad 
	ln -s tintin-rocket.scad rocket-level-1-part-2.scad 
	ln -s tintin-rocket.scad rocket-level-1-part-3.scad
	ln -s tintin-rocket.scad rocket-level-1-part-4.scad 
	ln -s tintin-rocket.scad rocket-level-1-part-5.scad 
	ln -s tintin-rocket.scad rocket-level-1-part-6.scad

	ln -s tintin-rocket.scad rocket-level-2-part-1.scad 
	ln -s tintin-rocket.scad rocket-level-2-part-2.scad 
	ln -s tintin-rocket.scad rocket-level-2-part-3.scad
	ln -s tintin-rocket.scad rocket-level-2-part-4.scad 
	ln -s tintin-rocket.scad rocket-level-2-part-5.scad 
	ln -s tintin-rocket.scad rocket-level-2-part-6.scad

	ln -s tintin-rocket.scad rocket-level-3-part-1.scad 
	ln -s tintin-rocket.scad rocket-level-3-part-2.scad 
	ln -s tintin-rocket.scad rocket-level-3-part-3.scad
	ln -s tintin-rocket.scad rocket-level-3-part-4.scad 
	ln -s tintin-rocket.scad rocket-level-3-part-5.scad 
	ln -s tintin-rocket.scad rocket-level-3-part-6.scad

	ln -s tintin-rocket.scad rocket-level-4-part-1.scad 
	ln -s tintin-rocket.scad rocket-level-4-part-2.scad 
	ln -s tintin-rocket.scad rocket-level-4-part-3.scad
	ln -s tintin-rocket.scad rocket-level-4-part-4.scad 
	ln -s tintin-rocket.scad rocket-level-4-part-5.scad 
	ln -s tintin-rocket.scad rocket-level-4-part-6.scad

	ln -s tintin-rocket.scad rocket-level-5-part-1.scad 
	ln -s tintin-rocket.scad rocket-level-5-part-2.scad 
	ln -s tintin-rocket.scad rocket-level-5-part-3.scad
	ln -s tintin-rocket.scad rocket-level-5-part-4.scad 
	ln -s tintin-rocket.scad rocket-level-5-part-5.scad 
	ln -s tintin-rocket.scad rocket-level-5-part-6.scad

	ln -s tintin-rocket.scad rocket-part-body.scad 
	ln -s tintin-rocket.scad rocket-part-capsule.scad 
	ln -s tintin-rocket.scad rocket-part-lander.scad 

build: $(STLFILES)

end:
	rm -f $(SCAD_TMP_FILES)

clean:
	rm -f *.stl $(SCAD_TMP_FILES)
