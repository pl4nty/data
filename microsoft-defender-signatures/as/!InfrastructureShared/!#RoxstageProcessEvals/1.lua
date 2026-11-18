-- Threat: !InfrastructureShared
-- Name: !#RoxstageProcessEvals
-- Type: 10
-- MpAttributes: !ValidDigitalSignature & !PEPCODE:HasDigitalSignature & RPF:TopLevelFile

if peattributes.isdll or peattributes.isdriver or peattributes.isdamaged then
  return mp.CLEAN
end
if mp.get_mpattribute("BM_RoxstageProcessEval") then
  return mp.CLEAN
end
if mp.get_mpattribute("BM_RoxstageProcessBlock") then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true or l_0_0 == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) ~= true then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
if l_0_1 == nil or l_0_1 ~= nil and 7200 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename()
local l_0_3 = string.lower(MpCommon.PathToWin32Path(l_0_2))
local l_0_4 = MpCommon.ExpandEnvironmentVariables("%programfiles(x86)%")
if l_0_4 ~= nil and l_0_4 ~= "" and string.find(l_0_3, string.lower(l_0_4), 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_5 = MpCommon.ExpandEnvironmentVariables("%programfiles%")
if l_0_5 ~= nil and l_0_5 ~= "" and string.find(l_0_3, string.lower(l_0_5), 1, true) ~= nil then
  return mp.CLEAN
end
if MpCommon.QueryPersistContext(l_0_2, "BM_RoxstageProcessEval") then
  return mp.CLEAN
end
if MpCommon.QueryPersistContext(l_0_2, "BM_RoxstageProcessBlock") then
  return mp.CLEAN
end
if mp.IsTrustedFile(false) == true then
  return mp.CLEAN
end
local l_0_6 = MpCommon.GetPersistContextCountNoPath("roxstagePersistedProcs")
if 15 <= l_0_6 then
  return mp.CLEAN
end
mp.set_mpattribute("BM_RoxstageProcessEval")
MpCommon.AppendPersistContext(l_0_2, "BM_RoxstageProcessEval", 0)
if l_0_6 == 0 then
  local l_0_7 = {}
  table.insert(l_0_7, l_0_2)
  MpCommon.SetPersistContextNoPath("roxstagePersistedProcs", l_0_7, 0)
else
  MpCommon.AppendPersistContextNoPath("roxstagePersistedProcs", l_0_2, 0)
end
return mp.CLEAN
