-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25d758cadf45\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if (mp.GetProcessCommandLine)(l_0_0) or not l_0_0 or "" ~= "webcache.exe" then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((MpCommon.GetImagePathFromPid)(l_0_0) or "")
if not l_0_1:find("appdata.-temp") then
  return mp.CLEAN
end
TrackPidAndTechnique("CMDHSTR", "T1574.001", "evasion_searchhijack_webcache")
return mp.INFECTED

