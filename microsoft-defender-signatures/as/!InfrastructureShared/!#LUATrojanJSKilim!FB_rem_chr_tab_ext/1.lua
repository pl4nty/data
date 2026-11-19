-- Threat: !InfrastructureShared
-- Name: !#LUA:Trojan:JS/Kilim!FB_rem_chr_tab_ext
-- Type: 13
-- MpAttributes: SCRIPT:ChromeUrlExtTab & SCRIPT:ChromeTabRemove

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1 == "chrome.exe" then
    mp.set_mpattribute("LUA:Trojan:JS/Kilim!FB_rem_chr_tab_ext")
  end
end
return mp.CLEAN
