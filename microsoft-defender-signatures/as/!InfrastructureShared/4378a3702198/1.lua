-- Threat: !InfrastructureShared
-- Name: 4378a3702198
-- Type: 21

if pehdr.NumberOfSections > 0 and epcode[1] == 255 and epcode[2] == 37 and pesecs[pehdr.NumberOfSections].Name == ".reloc" and mp.get_mpattribute("pea_no_relocs") and mp.get_mpattribute("pea_lastscn_executable") and mp.get_mpattribute("pea_lastscn_writable") and mp.get_mpattribute("pea_epinfirstsect") and mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
