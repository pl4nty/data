-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d5b351e420d1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 and l_0_0.ppid then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1565", "tamper_hosts_maliciousdomain")
end
return mp.INFECTED

