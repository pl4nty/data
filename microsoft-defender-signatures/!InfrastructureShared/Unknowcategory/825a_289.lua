-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\825a_289.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("NID:Trojan:Win64/Rootkit.MBXI!MTB") and (mp.get_mpattribute)("Lua:Issuer.Microsoft") and (mp.get_mpattribute)("pea_isdriver") then
  return mp.INFECTED
end
return mp.CLEAN

