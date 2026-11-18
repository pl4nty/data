-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/FileUnderCommonPaths
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 ~= nil and l_0_0:len() > 60 then
  local l_0_1 = string.lower(l_0_0)
  if string.match(l_0_1, "\\users\\[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache\\ie\\.+") then
    mp.set_mpattribute("Lua:Context/FileInINetCacheIE.A")
  end
  if string.find(l_0_1, "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook\\", 1, true) ~= nil then
    mp.set_mpattribute("Lua:FileInOutlookCache.A")
  end
  if string.match(l_0_1, "\\users\\[^\\]+\\appdata\\local\\microsoft\\windows\\inetcache\\low\\ie\\.+") then
    mp.set_mpattribute("Lua:Context/FileInINetCacheLowIE.A")
  end
  if string.find(l_0_1, "\\appdata\\local\\packages\\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\\localstate\\files\\", 1, true) ~= nil then
    mp.set_mpattribute("Lua:FileInWindowsMailApp.A")
  end
end
return mp.CLEAN
