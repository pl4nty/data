-- Threat: !InfrastructureShared
-- Name: 41d7a228aaf9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_0.image_path) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.image_path:match("([^\\]+)$")
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {
  ["cmd.exe"] = true
}
local l_0_3 = string.lower(l_0_1)
if not l_0_2[l_0_3] then
  return mp.CLEAN
end
local l_0_4 = mp.GetProcessCommandLine(l_0_0.ppid)
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {" -o ", ".hta"}
local l_0_6 = string.lower(l_0_4)
if not containsall(l_0_6, l_0_5) then
  return mp.CLEAN
end
local l_0_7 = {
  "mshta",
  "^m^s^h^t^a^",
  "curl",
  "call !"
}
local l_0_8 = string.lower(l_0_4)
if not contains(l_0_8, l_0_7) then
  return mp.CLEAN
end
return mp.INFECTED
