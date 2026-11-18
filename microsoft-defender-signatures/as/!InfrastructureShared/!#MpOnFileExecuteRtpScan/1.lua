-- Threat: !InfrastructureShared
-- Name: !#MpOnFileExecuteRtpScan
-- Type: 12
-- MpAttributes: !MpIsAMSIScan

local l_0_0 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) == true or mp.bitand(mp.get_contextdata(mp.CONTEXT_DATA_DESIREDACCESS), 32) == 32 then
  return mp.INFECTED
end
return mp.CLEAN
