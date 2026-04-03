-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7fd79c70cd5d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if not (string.find)(l_0_1, "--no-sandbox", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\slack.exe", 1, true) or (string.find)(l_0_1, "\\teams.exe", 1, true) or (string.find)(l_0_1, "\\discord.exe", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("CMDHSTR", "T1218.015", "ElectronNodeAbuse")
return mp.INFECTED

