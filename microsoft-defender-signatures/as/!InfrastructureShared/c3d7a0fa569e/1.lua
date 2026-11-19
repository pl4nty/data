-- Threat: !InfrastructureShared
-- Name: c3d7a0fa569e
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil or l_0_0.image_path == "" then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1 ~= nil and string.find(l_0_1, "/usr/bin/dpkg", 1, true) == 1 then
  return mp.CLEAN
end
return mp.INFECTED
