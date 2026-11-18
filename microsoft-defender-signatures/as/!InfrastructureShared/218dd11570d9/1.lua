-- Threat: !InfrastructureShared
-- Name: 218dd11570d9
-- Type: 21

if mp.getfilesize() > 5242880 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or #l_0_0 < 5 then
  return mp.CLEAN
end
local l_0_1 = mp.GetCertificateInfo()
if #l_0_1 < 1 or l_0_1 == nil then
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  MpCommon.BmTriggerSig(l_0_2, "BM_KeyChainAccess.A1", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
