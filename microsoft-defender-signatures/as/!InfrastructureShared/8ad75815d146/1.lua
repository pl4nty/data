-- Threat: !InfrastructureShared
-- Name: 8ad75815d146
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
local l_0_2 = string.match(l_0_1, "msiexec%.?e?x?e?\"?'?%s+(.*)$")
if contains(l_0_2, {".msi", ".exe"}) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.lower(string.sub(l_0_3.image_path, -7))
if l_0_4 ~= "cmd.exe" then
  return mp.CLEAN
end
local l_0_5 = mp.GetProcessCommandLine(l_0_3.ppid)
if l_0_5 ~= nil and string.match(l_0_5:lower(), "^%s*cmd%s*$") then
  return mp.INFECTED
end
return mp.CLEAN
