-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\78ea_268.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and peattributes.ismsil == true and (mp.get_mpattribute)("SIGATTR:Trojan:MSIL/Lazy.AIKA") then
  return mp.INFECTED
end
return mp.CLEAN

