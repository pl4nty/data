-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8022_279.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (not (mp.get_mpattribute)("NID:Trojan:Win32/Fragtor.AD!MTB")) then
  return mp.INFECTED
end
return mp.CLEAN

