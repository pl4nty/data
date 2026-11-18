-- Threat: !InfrastructureShared
-- Name: d1b36008927f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = ""
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p1 ~= "" then
  l_0_3 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_3 ~= "" and string.find(l_0_3, "/private/var/folders/[^/]+/[^/]+/t/.") == 1 then
  return mp.INFECTED
end
return mp.CLEAN
