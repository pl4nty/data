-- Threat: !InfrastructureShared
-- Name: !#SLF:TriggerCloudForNWMSI
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_OLE_FILE & !MpNwUnfriendly

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_TRUSTCHECK then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(42)
if crypto.bitand(l_0_1, 2) == 2 then
  return mp.INFECTED
end
if mp.IsTrustedFile(false) == false then
  return mp.INFECTED
end
return mp.CLEAN
