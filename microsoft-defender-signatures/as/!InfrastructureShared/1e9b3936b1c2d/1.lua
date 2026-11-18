-- Threat: !InfrastructureShared
-- Name: 1e9b3936b1c2d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "d9a6152d-f204-4f79-9124-02d20d71b4bb" then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
local l_0_3 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
else
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  return mp.INFECTED
end
return mp.CLEAN
