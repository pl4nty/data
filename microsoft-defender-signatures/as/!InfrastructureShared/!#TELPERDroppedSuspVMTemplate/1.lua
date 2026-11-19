-- Threat: !InfrastructureShared
-- Name: !#TELPER:DroppedSuspVMTemplate
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  return mp.CLEAN
end
if string.lower(string.sub(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME), -3)) ~= ".vm" then
  return mp.CLEAN
end
if string.find(string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)), "atlassian\\confluence\\extra\\widgetconnector\\templates", 1, true) then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
if not MpCommon.QueryPersistContext(l_0_0, "DroppedSuspVMTemplate") then
  MpCommon.AppendPersistContext(l_0_0, "DroppedSuspVMTemplate", 0)
end
return mp.CLEAN
