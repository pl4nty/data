-- Threat: !InfrastructureShared
-- Name: d9d734c6beaf
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
local l_0_2 = mp.GetParentProcInfo(l_0_0.ppid)
if isnull(l_0_2) or isnull(l_0_2.ppid) or isnull(l_0_2.image_path) then
  return mp.CLEAN
end
local l_0_3 = l_0_2.image_path:match("([^\\]+)$")
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  ["sqlservr.exe"] = true
}
local l_0_5 = string.lower(l_0_1)
local l_0_6 = string.lower(l_0_3)
if not l_0_4[l_0_5] and not l_0_4[l_0_6] then
  return mp.CLEAN
end
return mp.INFECTED
