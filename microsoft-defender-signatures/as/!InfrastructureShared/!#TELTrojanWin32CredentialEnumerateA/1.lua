-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/CredentialEnumerate.A
-- Type: 10
-- Includes: AgePrevalence

local l_0_0 = mp.getfilename()
if not MpCommon.QueryPersistContext(l_0_0, "SuspCredEnumerateAttempt") then
  return mp.CLEAN
end
if mp.IsTrustedFile(false) == true then
  return mp.CLEAN
end
local l_0_1, l_0_2 = getAgePrev(false)
if l_0_1 <= 1 and l_0_2 <= 100 then
  return mp.INFECTED
end
return mp.CLEAN
