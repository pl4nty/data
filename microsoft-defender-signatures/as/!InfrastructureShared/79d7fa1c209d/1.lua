-- Threat: !InfrastructureShared
-- Name: 79d7fa1c209d
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
  ["services.exe"] = true
}
local l_0_3 = string.lower(l_0_1)
if not l_0_2[l_0_3] then
  return mp.CLEAN
end
return mp.INFECTED
