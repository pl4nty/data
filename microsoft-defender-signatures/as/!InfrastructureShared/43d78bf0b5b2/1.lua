-- Threat: !InfrastructureShared
-- Name: 43d78bf0b5b2
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(string.sub(l_0_0.image_path, -12))
if l_0_1 ~= "psexesvc.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 or #l_0_3 <= 10 then
  return mp.CLEAN
end
if contains(l_0_3, "\\share$\\") or contains(l_0_3, "\\admin$\\") or contains(l_0_3, " \\\\") or contains(l_0_3, " \"\"\\\\") then
  return mp.INFECTED
end
return mp.CLEAN
