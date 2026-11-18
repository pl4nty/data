-- Threat: !InfrastructureShared
-- Name: adb3f29b954a
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
if l_0_2:find("Frameworks/Chromium Framework.framework/Versions", 1, true) or l_0_2:find("^node", 1, false) or l_0_2:find("mpm install --release", 1, true) or l_0_2:find("/bin/node", 1, true) or l_0_2:find("/node_modules/app-builder-bin", 1, true) or l_0_2:find("/PrinterLogicIdpAuthentication", 1, true) or l_0_2:find("Lark Framework Lark Framework.framework", 1, true) or l_0_2:find("XcodeDefault.xctoolchain", 1, true) or l_0_2:find("MacOS/EpicGamesLauncher-", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
