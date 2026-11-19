-- Threat: !InfrastructureShared
-- Name: ffb36c89f9e0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_4) do
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected", l_0_6.ppid)
end
return mp.INFECTED
