-- Threat: !InfrastructureShared
-- Name: c3b3d774e87b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4, l_0_5 = l_0_3:match("^/users/[^/]+/library/(.*)/([^/]+)%.app/contents/macos/[^/]+$")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_6 = {
  finder = true,
  ["software update"] = true,
  ["system settings"] = true,
  ["system preferences"] = true,
  systemuiserver = true,
  dock = true,
  safari = true,
  spotlight = true,
  keychain = true
}
if l_0_6[l_0_5] or l_0_4:find("com%.apple%.") then
  return mp.INFECTED
end
return mp.CLEAN
