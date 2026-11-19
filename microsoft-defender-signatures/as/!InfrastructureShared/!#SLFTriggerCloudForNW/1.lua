-- Threat: !InfrastructureShared
-- Name: !#SLF:TriggerCloudForNW
-- Type: 10
-- MpAttributes: !MpNwUnfriendly

local l_0_0 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 == nil or l_0_1 ~= mp.SCANREASON_TRUSTCHECK then
  return mp.CLEAN
end
if mp.IsTrustedFile(false) == false then
  return mp.INFECTED
end
return mp.CLEAN
