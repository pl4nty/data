-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7db388d625e8\0x00009c30_luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 150000000 then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
return mp.INFECTED

