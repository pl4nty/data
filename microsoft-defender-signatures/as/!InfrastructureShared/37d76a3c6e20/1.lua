-- Threat: !InfrastructureShared
-- Name: 37d76a3c6e20
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_0.image_path) then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
if isnull(l_0_1) or isnull(l_0_1.ppid) or isnull(l_0_1.image_path) then
  return mp.CLEAN
end
local l_0_2 = l_0_1.image_path:match("([^\\]+)$")
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  ["services.exe"] = true,
  ["svchost.exe"] = true,
  ["hys9eas_epmsystem4.exe"] = true
}
if l_0_3[string.lower(l_0_2)] then
  return mp.CLEAN
end
local l_0_4 = {"backup", "oracle"}
if contains(string.lower(l_0_2), l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
