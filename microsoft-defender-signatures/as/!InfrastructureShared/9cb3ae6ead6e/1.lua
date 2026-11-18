-- Threat: !InfrastructureShared
-- Name: 9cb3ae6ead6e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
if not this_sigattrlog[3].matched or this_sigattrlog[3].utf8p1 == nil or this_sigattrlog[3].utf8p1 == "" or this_sigattrlog[3].utf8p2 == nil or this_sigattrlog[3].utf8p2 == "" then
  return mp.CLEAN
end
l_0_0 = bm.get_imagepath()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = bm.get_current_process_startup_info()
if l_0_3 == nil then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_3.command_line) then
  return mp.CLEAN
end
l_0_1 = this_sigattrlog[3].utf8p1:match("([^/]+)%s*%d*$")
l_0_2 = this_sigattrlog[3].utf8p2:match("([^/]+)%s*%d*$")
if l_0_1 ~= nil and l_0_2 ~= nil and l_0_1 ~= "" and l_0_1:lower() == l_0_2:lower() then
  return mp.INFECTED
end
return mp.CLEAN
