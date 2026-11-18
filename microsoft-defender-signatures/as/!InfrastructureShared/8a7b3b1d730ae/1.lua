-- Threat: !InfrastructureShared
-- Name: 8a7b3b1d730ae
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[3].utf8p2
else
  return mp.CLEAN
end
if l_0_3 == nil or l_0_3 == "" or not string.find(l_0_3, "/private/tmp/", 1, true) and not string.find(l_0_3, "/Users/Shared/", 1, true) and not string.find(l_0_3, "/Library/Caches/", 1, true) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_3) then
  bm.add_threat_file(l_0_3)
end
return mp.INFECTED
