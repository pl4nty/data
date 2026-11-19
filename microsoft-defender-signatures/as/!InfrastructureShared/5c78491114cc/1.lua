-- Threat: !InfrastructureShared
-- Name: 5c78491114cc
-- Type: 21

if pehdr.NumberOfSections > 0 and epcode[2] == 131 and epcode[3] == 236 and epcode[5] == 232 and epcode[11] == 131 and epcode[12] == 196 and epcode[14] == 233 and pesecs[pehdr.NumberOfSections].Name == ".reloc" and mp.get_mpattribute("pea_no_relocs") and mp.get_mpattribute("pea_lastscn_executable") and mp.get_mpattribute("pea_lastscn_writable") and mp.get_mpattribute("pea_epinfirstsect") and mp.get_mpattribute("pea_isexe") then
  if pesecs[pehdr.NumberOfSections].SizeOfRawData > pesecs[1].SizeOfRawData then
    return mp.INFECTED
  end
  if mp.get_mpattribute("pea_executes_from_last_section") then
    return mp.INFECTED
  end
end
return mp.CLEAN
