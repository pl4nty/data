-- Threat: !InfrastructureShared
-- Name: 120d76ea9db5a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower()
if string.find(l_0_2, "wscript.exe", 1, true) and string.find(l_0_2, ".js", 1, true) then
  local l_0_3 = {
    "explorer.exe",
    "chrome.exe"
  }
  if IsProcNameInParentProcessTree("cmdhstr", l_0_3) then
    return mp.INFECTED
  end
end
return mp.CLEAN
