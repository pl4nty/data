-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a7ad_1339.luac 

-- params : ...
-- function num : 0
if peattributes.is_process or pehdr.NumberOfSections < 2 or (pesecs[pehdr.NumberOfSections]).SizeOfRawData <= 1024 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC171: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC171: Unhandled construct in 'MakeBoolean' P3

if (((epcode[1] ~= 232 or epcode[6] ~= 233 or epcode[10] ~= 255) and epcode[1] == 85 and epcode[2] == 139 and epcode[3] == 236 and epcode[1] == 139 and epcode[2] == 255 and epcode[3] == 85 and epcode[4] == 139 and epcode[5] ~= 236) or (pesecs[1]).Name ~= ".text" or ((pesecs[pehdr.NumberOfSections]).Name ~= ".reloc" and (pesecs[pehdr.NumberOfSections]).Name ~= ".rsrc" and (pesecs[pehdr.NumberOfSections]).Name ~= ".data") or not (mp.get_mpattribute)("pea_no_relocs") or not (mp.get_mpattribute)("pea_lastscn_executable") or not (mp.get_mpattribute)("pea_lastscn_writable") or not (mp.get_mpattribute)("pea_no_security") or not (mp.get_mpattribute)("pea_epinfirstsect") or not (mp.get_mpattribute)("pea_isexe") or not (mp.get_mpattribute)("pea_lastscn_vfalign") or (pesecs[pehdr.NumberOfSections]).SizeOfRawData + 8192 > (pesecs[pehdr.NumberOfSections]).VirtualSize or (pesecs[pehdr.NumberOfSections]).VirtualSize % 4096 ~= 0 or (pesecs[pehdr.NumberOfSections]).SizeOfRawData % pehdr.FileAlignment == 0) then
  return mp.INFECTED
end
return mp.CLEAN

