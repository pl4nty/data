-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3fd7ebfeea6b\0x00001ce3_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.ppid ~= "" then
  TrackPidAndTechnique(l_0_0.ppid, "T1489", "Impact_ServiceStop_Virsh")
end
return mp.INFECTED

