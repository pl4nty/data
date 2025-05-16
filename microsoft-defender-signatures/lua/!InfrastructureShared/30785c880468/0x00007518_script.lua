-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\30785c880468\0x00007518_luac 

-- params : ...
-- function num : 0
if (mp.GetHSTRCallerId)() == mp.HSTR_CALLER_SMS then
  reportDetectedRegions()
end
return mp.INFECTED

