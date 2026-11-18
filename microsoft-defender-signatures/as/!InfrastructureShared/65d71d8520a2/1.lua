-- Threat: !InfrastructureShared
-- Name: 65d71d8520a2
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.find(l_0_1, "--remote-debugging-port", 1, true) or string.find(l_0_1, "--inspect", 1, true)
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "\\code.exe",
  "\\code - insiders.exe",
  "\\cursor.exe",
  "\\windsurf.exe",
  "\\electron.exe",
  "\\electron-fiddle",
  "\\electron-forge",
  "\\fleet.exe",
  "\\brave.exe",
  "\\chrome.exe",
  "\\msedge.exe",
  "\\opera.exe",
  "\\vivaldi.exe",
  "\\chromium.exe"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.find(l_0_1, l_0_5, 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("CMDHSTR", "T1218.015", "ElectronDebugAbuse")
return mp.INFECTED
