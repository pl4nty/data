-- Threat: !InfrastructureShared
-- Name: 27b3a1240800
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "\\windowsapps\\", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_1, "\\appdata\\local\\packages\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2)
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3
if string.find(l_0_2, "/j[%s]+\"") ~= nil then
  l_0_3 = string.match(l_0_2, "/j[%s]+(\"[^\"]+\") ")
else
  l_0_3 = string.match(l_0_2, "/j[%s]+([%S]+) ")
end
if l_0_3 == nil then
  return mp.CLEAN
end
if string.find(l_0_3, "\\appdata\\local\\packages\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_4
if string.sub(l_0_2, -1) == "\"" then
  l_0_4 = string.match(l_0_2, " (\"[^\"]+\")$")
else
  l_0_4 = string.match(l_0_2, " (%S+)$")
end
if l_0_4 == nil then
  return mp.CLEAN
end
if string.find(l_0_4, "\\appdata\\local\\packages\\", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
