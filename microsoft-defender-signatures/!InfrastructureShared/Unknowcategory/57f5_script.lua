-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\57f5_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("SIGATTR:Trojan:MSIL/Zusy.RX!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

