-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7fca_274.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and peattributes.ismsil == true and (mp.get_mpattribute)("SIGATTR:Trojan:MSIL/Taskun.AMAK!MTB") then
  return mp.INFECTED
end
return mp.CLEAN

