-- Threat: !InfrastructureShared
-- Name: 2bfd7438f0edf
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
l_0_3 = string.lower(l_0_3)
if not contains(l_0_3, "http") then
  return mp.CLEAN
end
local l_0_4, l_0_5 = string.gsub(l_0_3, "^", "")
if l_0_4 and contains(l_0_4, {
  "powershell",
  "mshta",
  "curl"
}) then
  return mp.INFECTED
end
return mp.CLEAN
