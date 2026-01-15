-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb341671653\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= "" and (this_sigattrlog[4]).utf8p2 ~= nil then
  local l_0_0 = (bm.get_current_process_startup_info)()
  local l_0_1 = l_0_0.command_line
  local l_0_2 = (bm.get_imagepath)()
  if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
    return mp.CLEAN
  end
  if l_0_2:find("ODIS/AdODIS-installer.app/Contents/MacOS", 1, true) or l_0_2:find("Frameworks/Squirrel.framework/Versions/A/Resources/ShipIt", 1, true) or l_0_2:find("GoogleUpdater.app/Contents/MacOS/GoogleUpdater", 1, true) or l_0_2:find("/Applications/Logos.app/Contents/MacOS/Logos", 1, true) or l_0_2:find("/Applications/Proclaim.app/Contents/MacOS/Proclaim", 1, true) or l_0_1:find("/Applications/Connect to Network.app", 1, true) or l_0_2:find("Logos.app.bundle/Contents/MacOS/Logos", 1, true) or l_0_2:find("/Library/PrivilegedHelperTools/fr.whitebox.packages/packages_builder", 1, true) or l_0_1:find("Utilities/SWR/ZBrush Installer/Maxon ZBrush", 1, true) or l_0_1:find("sudo-prompt-applet.zip", 1, true) or l_0_2:find("/Applications/Visual Studio Code", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = (this_sigattrlog[4]).utf8p2
  if SuspMacPathsToMonitor(l_0_3, true) or (string.find)(l_0_3, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_3, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_3, "/Users/[^/]+/Desktop/", 1, false) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

