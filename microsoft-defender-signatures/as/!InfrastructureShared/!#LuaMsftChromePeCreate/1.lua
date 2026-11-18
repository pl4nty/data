-- Threat: !InfrastructureShared
-- Name: !#Lua:MsftChromePeCreate
-- Type: 9

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  return mp.CLEAN
end
local l_0_0 = {
  ["chrome.exe"] = true
}
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 and not l_0_0[string.lower(l_0_1)] then
  return mp.CLEAN
end
return mp.LOWFI
