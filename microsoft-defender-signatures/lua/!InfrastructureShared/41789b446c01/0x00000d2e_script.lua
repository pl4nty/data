-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41789b446c01\0x00000d2e_luac 

-- params : ...
-- function num : 0
if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
  return mp.LOWFI
end
reportDetectedRegions()
return mp.INFECTED

