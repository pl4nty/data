-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8061_278.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("NID:Emotet.BD!Pra1") or (mp.get_mpattribute)("NID:Emotet.BD!Pra2") or (mp.get_mpattribute)("NID:Emotet.BD!Pra3") then
  return mp.INFECTED
end
return mp.CLEAN

