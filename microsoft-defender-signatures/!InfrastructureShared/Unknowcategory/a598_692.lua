-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a598_692.luac 

-- params : ...
-- function num : 0
if peattributes.is_process then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 0 and epcode[1] == 232 and epcode[6] == 233 and epcode[10] == 255 and (pesecs[1]).Name == ".text" and (pesecs[pehdr.NumberOfSections]).Name == ".reloc" and (mp.get_mpattribute)("pea_no_relocs") and (mp.get_mpattribute)("pea_lastscn_executable") and (mp.get_mpattribute)("pea_epinfirstsect") and (mp.get_mpattribute)("pea_isexe") and (mp.get_mpattribute)("pea_lastscn_writable") then
  return mp.INFECTED
end
return mp.CLEAN

