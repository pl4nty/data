-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3f29b954a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
local l_0_1 = (bm.get_current_process_startup_info)()
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
if l_0_2:find("Frameworks/Chromium Framework.framework/Versions", 1, true) or l_0_2:find("^node", 1, false) or l_0_2:find("mpm install --release", 1, true) or l_0_2:find("/bin/node", 1, true) or l_0_2:find("/node_modules/app-builder-bin", 1, true) or l_0_2:find("MacOS/EpicGamesLauncher-", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

