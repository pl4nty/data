-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7dd70a09777e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["T1098.007"] = "persist_user_local"
l_0_0["T1136.001"] = "persist_user_local"
TrackPidAndMultipleTechniques("CMDHSTR", l_0_0)
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 and l_0_1.ppid then
  TrackPidAndMultipleTechniques(l_0_1.ppid, l_0_0)
end
return mp.INFECTED

