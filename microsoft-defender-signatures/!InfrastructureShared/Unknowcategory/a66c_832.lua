-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a66c_832.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections > 0 and epcode[2] == 131 and epcode[3] == 236 and epcode[5] == 232 and epcode[11] == 131 and epcode[12] == 196 and epcode[14] == 233 and (pesecs[pehdr.NumberOfSections]).Name == ".reloc" and (mp.get_mpattribute)("pea_no_relocs") and (mp.get_mpattribute)("pea_lastscn_executable") and (mp.get_mpattribute)("pea_lastscn_writable") and (mp.get_mpattribute)("pea_epinfirstsect") and (mp.get_mpattribute)("pea_isexe") then
  if (pesecs[1]).SizeOfRawData < (pesecs[pehdr.NumberOfSections]).SizeOfRawData then
    return mp.INFECTED
  end
  if (mp.get_mpattribute)("pea_executes_from_last_section") then
    return mp.INFECTED
  end
end
return mp.CLEAN

