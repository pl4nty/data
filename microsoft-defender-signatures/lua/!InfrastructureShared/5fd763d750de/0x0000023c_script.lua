-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5fd763d750de\0x0000023c_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsPidExcluded(l_0_0) then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0, "T1490", "inhibit_winre_recovery")
return mp.INFECTED

