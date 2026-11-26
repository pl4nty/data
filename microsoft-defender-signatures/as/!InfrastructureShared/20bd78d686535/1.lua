-- Threat: !InfrastructureShared
-- Name: 20bd78d686535
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
local l_0_4 = mp.GetParentProcInfo(l_0_0.ppid)
if isnull(l_0_4) or isnull(l_0_4.ppid) or isnull(l_0_4.image_path) then
  return mp.CLEAN
end
local l_0_5 = l_0_4.image_path:match("([^\\]+)$")
if isnull(l_0_5) then
  return mp.CLEAN
end
local l_0_6 = {
  ["applauncher.exe"] = true
}
local l_0_7 = string.lower(l_0_5)
if not l_0_6[l_0_7] then
  return mp.CLEAN
end
return mp.INFECTED
