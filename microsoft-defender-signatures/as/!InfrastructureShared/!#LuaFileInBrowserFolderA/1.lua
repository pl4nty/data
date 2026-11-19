-- Threat: !InfrastructureShared
-- Name: !#Lua:FileInBrowserFolder.A
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 ~= nil and l_0_0:len() > 60 then
  local l_0_1 = {
    ["Lua:FileInMicrosoftEdgeCache.A"] = "\\users\\[^\\]+\\appdata\\local\\packages\\microsoft.microsoftedge_8wekyb3d8bbwe\\.+\\#!.+\\microsoftedge\\cache\\.+",
    ["Lua:FileInMicrosoftEdgeDownloadsFolder.A"] = "\\users\\[^\\]+\\appdata\\local\\packages\\microsoft.microsoftedge_8wekyb3d8bbwe\\tempstate\\downloads.*",
    ["Lua:FileInInternetExplorerTemp.A"] = "\\users\\[^\\]+\\appdata\\local\\microsoft\\windows\\temporary internet files\\content.ie5\\.+",
    ["Lua:FileInChromeCache.A"] = "\\users\\[^\\]+\\appdata\\local\\google\\chrome\\user data\\default\\cache\\.+",
    ["Lua:FileInOperaCache.A"] = "\\users\\[^\\]+\\appdata\\local\\opera software\\opera stable\\cache\\.+",
    ["Lua:FileInFilefoxCache.A"] = "\\users\\[^\\]+\\appdata\\local\\mozilla\\firefox\\profiles\\.+%.default\\cache2\\entries\\.+"
  }
  local l_0_2 = string.lower(l_0_0)
  for l_0_3, l_0_4 in pairs(l_0_1) do
    if string.match(l_0_2, l_0_4) then
      mp.set_mpattribute(l_0_3)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
