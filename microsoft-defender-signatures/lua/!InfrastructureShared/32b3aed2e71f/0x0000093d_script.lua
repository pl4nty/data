-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3aed2e71f\0x0000093d_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if not (string.find)(l_0_2, "com.apple.webkit.networking", 1, true) and not (string.find)(l_0_2, "com.apple.safari.sandboxbroker", 1, true) and (IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2)) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p2 ~= "" then
  l_0_3 = (this_sigattrlog[1]).utf8p2
else
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_BROWSERDOWNLOAD_PATH", "mac_browserdownload_path", l_0_3) or SuspMacPathsToMonitor(l_0_3, true) then
  return mp.INFECTED
end
return mp.CLEAN

