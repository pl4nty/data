-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\70c5_252.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("NID:Trojan:Win64/Lotok.RF!MTB") or (mp.get_mpattribute)("NID:Trojan:Win64/Lotok.RG!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

