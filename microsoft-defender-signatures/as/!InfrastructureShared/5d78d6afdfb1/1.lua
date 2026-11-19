-- Threat: !InfrastructureShared
-- Name: 5d78d6afdfb1
-- Type: 21

if peattributes.is_process then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 0 and epcode[1] == 232 and epcode[6] == 233 and epcode[10] == 255 and pesecs[1].Name == ".text" and pesecs[pehdr.NumberOfSections].Name == ".reloc" and mp.get_mpattribute("pea_no_relocs") and mp.get_mpattribute("pea_lastscn_executable") and mp.get_mpattribute("pea_epinfirstsect") and mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("pea_lastscn_writable") then
  return mp.INFECTED
end
return mp.CLEAN
