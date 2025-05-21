-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\58f4_196.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("SIGATTR:Adware:Win32/GameVance.A") then
  return mp.INFECTED
end
return mp.CLEAN

