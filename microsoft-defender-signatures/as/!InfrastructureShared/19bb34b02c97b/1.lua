-- Threat: !InfrastructureShared
-- Name: 19bb34b02c97b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower():find("/kandji/kandji agent.app/") then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
if l_0_2 == nil or l_0_2 == "" or l_0_2:lower():find("/scripts/com.microsoft.wdav[^/]+/") or l_0_2:lower():find("script for mosyle mdm") then
  return mp.CLEAN
end
if not IsExcludedByCmdlineMacOS(l_0_2) and not IsExcludedByImagePathMacOS(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
