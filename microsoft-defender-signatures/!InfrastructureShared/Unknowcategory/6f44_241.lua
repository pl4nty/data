-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6f44_241.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (mp.get_mpattribute)("NID:Trojan:Win32/Ekstak.AN!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

