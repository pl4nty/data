-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaTestMode_fde8\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Lua:TestMode_fde8") then
  return mp.CLEAN
end
AddToAtomicCounter("TestMode_fde8", 1, 3600)
return mp.INFECTED

