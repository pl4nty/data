-- Threat: !InfrastructureShared
-- Name: 53d751a079a1
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.image_path
local l_0_2 = string.lower(string.match(l_0_1, "\\([^\\]+)$"))
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if string.find(l_0_2, "tomcat%d.exe") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
