-- Threat: !InfrastructureShared
-- Name: !#Lua:FileInsideBrowserExtensionOnWindows
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile & Lua:FileInsideAppDataLocalFolder

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "\\google\\chrome\\user data\\default\\extensions\\", 1, true) then
  mp.set_mpattribute("Lua:Context/FileInsideChromeExtensionOnWindows")
elseif string.find(l_0_0, "\\microsoft\\edge\\user data\\default\\extensions\\", 1, true) then
  mp.set_mpattribute("Lua:Context/FileInsideEdgeExtensionOnWindows")
end
return mp.CLEAN
