-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\198d7d1cc07d3\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1562.001", "mptamper_av")
end
return mp.INFECTED

