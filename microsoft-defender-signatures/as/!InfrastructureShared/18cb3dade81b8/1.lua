-- Threat: !InfrastructureShared
-- Name: 18cb3dade81b8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil and this_sigattrlog[6].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[6].utf8p2
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
if is_valid_ip(l_0_0) then
  bm.trigger_sig("GenericReverseShell", l_0_1, l_0_2.ppid)
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  return mp.INFECTED
end
return mp.CLEAN
