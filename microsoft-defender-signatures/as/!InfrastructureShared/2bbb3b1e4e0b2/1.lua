-- Threat: !InfrastructureShared
-- Name: 2bbb3b1e4e0b2
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil and this_sigattrlog[6].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil and this_sigattrlog[7].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[7].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2.command_line
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
local l_0_4, l_0_5 = extract_urls(l_0_0)
local l_0_6 = false
if (l_0_4 ~= nil or l_0_5 ~= nil) and (0 < #l_0_4 or 0 < #l_0_5) then
  l_0_6 = true
end
if l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
