-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a726_1015.luac 

-- params : ...
-- function num : 0
if peattributes.is_process then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 0 and epcode[1] == 233 and epcode[5] == 255 and epcode[6] == 204 and epcode[7] == 204 and epcode[8] == 204 and (pesecs[1]).Name == ".text" and (pesecs[pehdr.NumberOfSections]).Name == ".symtab" then
  if (pesecs[pehdr.NumberOfSections]).SizeOfRawData <= 1024 then
    return mp.CLEAN
  end
  if (mp.get_mpattribute)("pea_no_relocs") and (mp.get_mpattribute)("pea_lastscn_executable") and (mp.get_mpattribute)("pea_lastscn_writable") and (mp.get_mpattribute)("pea_no_security") and (mp.get_mpattribute)("pea_epinfirstsect") and (mp.get_mpattribute)("pea_isexe") and (mp.get_mpattribute)("pea_lastscn_vfalign") and (pesecs[pehdr.NumberOfSections]).SizeOfRawData + 4096 == (pesecs[pehdr.NumberOfSections]).VirtualSize and (pesecs[pehdr.NumberOfSections]).VirtualSize % 4096 == 0 then
    return mp.INFECTED
  end
end
return mp.CLEAN

