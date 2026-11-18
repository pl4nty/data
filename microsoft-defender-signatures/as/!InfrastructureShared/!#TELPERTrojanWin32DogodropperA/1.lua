-- Threat: !InfrastructureShared
-- Name: !#TELPER:Trojan:Win32/Dogodropper.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
if MpCommon.QueryPersistContext(mp.getfilename(), "DroppedSuspVMTemplate") then
  return mp.INFECTED
end
return mp.CLEAN
