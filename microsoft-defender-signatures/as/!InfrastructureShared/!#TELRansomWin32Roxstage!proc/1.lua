-- Threat: !InfrastructureShared
-- Name: !#TEL:Ransom:Win32/Roxstage!proc
-- Type: 10
-- MpAttributes: !ValidDigitalSignature & !PEPCODE:HasDigitalSignature & RPF:TopLevelFile

if peattributes.isdll or peattributes.isdriver or peattributes.isdamaged then
  return mp.CLEAN
end
if not mp.get_mpattribute("CLOUD:RoxstageBlockAccess") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
if not mp.get_mpattribute("BM_RoxstageProcessBlock") and not MpCommon.QueryPersistContext(l_0_0, "BM_RoxstageProcessBlock") then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(l_0_0, "CLOUD:RoxstageBlockAccess") then
  MpCommon.AppendPersistContext(l_0_0, "CLOUD:RoxstageBlockAccess", 0)
end
return mp.INFECTED
