-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualBrowserDownload.A
-- Type: 12

if not mp.IsHipsRuleEnabled("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = {
  ["iexplore.exe"] = true,
  ["firefox.exe"] = true,
  ["chrome.exe"] = true,
  ["opera.exe"] = true,
  ["microsoftedge.exe"] = true,
  ["browser_broker.exe"] = true,
  ["antimalware.tools.testhips.exe"] = true
}
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0[l_0_1] == nil then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
return mp.CLEAN
