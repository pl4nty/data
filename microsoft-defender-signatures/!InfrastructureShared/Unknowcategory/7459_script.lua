-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7459_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("NID:Trojan:Win64/Stealc.RPX1!MTB") and (mp.get_mpattribute)("CERT:Trojan:Win64/Stealc.RPX1!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

