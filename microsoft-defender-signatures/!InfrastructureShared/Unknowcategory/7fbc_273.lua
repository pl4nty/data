-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7fbc_273.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (not (mp.get_mpattribute)("NID:Trojan:Win64/Zusy.AP!MTB")) then
  return mp.INFECTED
end
return mp.CLEAN

