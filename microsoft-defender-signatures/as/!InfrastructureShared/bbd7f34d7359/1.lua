-- Threat: !InfrastructureShared
-- Name: bbd7f34d7359
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "chrome.exe",
  "msedge.exe",
  "brave.exe",
  "firefox.exe"
}
if IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
