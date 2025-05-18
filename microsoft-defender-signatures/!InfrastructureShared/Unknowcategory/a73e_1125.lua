-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a73e_1125.luac 

-- params : ...
-- function num : 0
if peattributes.is_process then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 0 and epcode[1] == 72 and epcode[2] == 131 and epcode[3] == 236 and epcode[5] == 232 and epcode[11] == 131 and epcode[12] == 196 and epcode[13] == 40 and epcode[14] == 233 and (pesecs[1]).Name == ".text" and (pesecs[pehdr.NumberOfSections]).Name == ".reloc" then
  if (pesecs[pehdr.NumberOfSections]).SizeOfRawData <= 1024 then
    return mp.CLEAN
  end
  if (mp.get_mpattribute)("pea_no_relocs") and (mp.get_mpattribute)("pea_lastscn_executable") and (mp.get_mpattribute)("pea_lastscn_writable") and (mp.get_mpattribute)("pea_no_security") and (mp.get_mpattribute)("pea_epinfirstsect") and (mp.get_mpattribute)("pea_isexe") and (mp.get_mpattribute)("pea_lastscn_vfalign") and (pesecs[pehdr.NumberOfSections]).SizeOfRawData + 4096 == (pesecs[pehdr.NumberOfSections]).VirtualSize and (pesecs[pehdr.NumberOfSections]).VirtualSize % 4096 == 0 then
    return mp.INFECTED
  end
end
return mp.CLEAN

