-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a4e7_605.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections > 0 and epcode[1] == 255 and epcode[2] == 37 and (pesecs[pehdr.NumberOfSections]).Name == ".reloc" and (mp.get_mpattribute)("pea_no_relocs") and (mp.get_mpattribute)("pea_lastscn_executable") and (mp.get_mpattribute)("pea_lastscn_writable") and (mp.get_mpattribute)("pea_epinfirstsect") and (mp.get_mpattribute)("pea_isexe") and (mp.get_mpattribute)("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN

