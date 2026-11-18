-- Threat: !InfrastructureShared
-- Name: 210b36ccf6cb6
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
if l_0_2:find("/Applications/Microsoft Teams.app", 1, true) or l_0_2:find("/Applications/SpaceId.app/Contents/MacOS/SpaceId", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
