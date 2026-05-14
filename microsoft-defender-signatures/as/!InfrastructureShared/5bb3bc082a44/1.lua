-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3bc082a44\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.AtomicCounterValue)("CVE-2026-31431-Burst")
if not l_0_0 or l_0_0 == 0 then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1068", "PrivilegeEscalation_CVE-2026-31431")
return mp.INFECTED

