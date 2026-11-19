-- Threat: !InfrastructureShared
-- Name: 43d72499dce0
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
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if #l_0_3 < 50 then
  return mp.CLEAN
end
l_0_3 = string.gsub(l_0_3, "^", "")
if contains(l_0_3, {
  "mshta",
  "https://",
  "http://"
}) then
  return mp.INFECTED
end
return mp.CLEAN
