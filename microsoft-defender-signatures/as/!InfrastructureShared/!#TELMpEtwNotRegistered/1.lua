-- Threat: !InfrastructureShared
-- Name: !#TEL:MpEtwNotRegistered
-- Type: 13
-- MpAttributes: /MpEtwPublisherKeyScan

if mp.GetResmgrBasePlugin() ~= "Regkeyvalue" then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "hklm\\software\\microsoft\\windows\\currentversion\\winevt\\publishers\\{751ef305-6c6e-4fed-b847-02ef79d26aef}", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\WINEVT\\Publishers\\{0a002690-3839-4e3a-b3b6-96d8df868d99}")
if l_0_1 == nil then
  return mp.INFECTED
end
return mp.CLEAN
