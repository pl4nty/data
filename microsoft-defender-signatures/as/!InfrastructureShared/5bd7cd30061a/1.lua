-- Threat: !InfrastructureShared
-- Name: 5bd7cd30061a
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
local l_0_5 = {
  "/c",
  "powershell.exe"
}
local l_0_6 = string.lower(l_0_4)
if not containsall(l_0_6, l_0_5) then
  return mp.CLEAN
end
local l_0_7 = mp.GetParentProcInfo(l_0_0.ppid)
if isnull(l_0_7) or isnull(l_0_7.ppid) or isnull(l_0_7.image_path) then
  return mp.CLEAN
end
local l_0_8 = l_0_7.image_path:match("([^\\]+)$")
if isnull(l_0_8) then
  return mp.CLEAN
end
local l_0_9 = {
  ["sqlservr.exe"] = true
}
local l_0_10 = string.lower(l_0_8)
if not l_0_9[l_0_10] then
  return mp.CLEAN
end
return mp.INFECTED
