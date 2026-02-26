-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3bc59be21\1.luac 

-- params : ...
-- function num : 0
if GetRollingQueueCount("FireFalcon_Clash") > 0 then
  return mp.CLEAN
end
;
(MpCommon.RollingQueueCreate)("FireFalcon_Clash", 1, 172800)
return mp.INFECTED

