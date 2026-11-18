-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVBrowser
-- Type: 12

local l_0_0 = mp.IOAVGetDownloadBrowser()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if l_0_0 == "utorrent.exe" or l_0_0 == "bittorrent.exe" then
    mp.set_mpattribute("Lua:IOAVBrowserUtorrent")
  elseif l_0_0 == "chrome.exe" then
    mp.set_mpattribute("Lua:IOAVBrowserChrome")
  elseif l_0_0 == "browser_broker.exe" then
    mp.set_mpattribute("Lua:IOAVBrowserEdge")
  elseif l_0_0 == "iexplore.exe" then
    mp.set_mpattribute("Lua:IOAVBrowserIE")
  elseif l_0_0 == "opera.exe" then
    mp.set_mpattribute("Lua:IOAVBrowserOpera")
  end
end
return mp.CLEAN
