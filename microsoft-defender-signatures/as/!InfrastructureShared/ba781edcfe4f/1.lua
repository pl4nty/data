-- Threat: !InfrastructureShared
-- Name: ba781edcfe4f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetHSTRCallerId()
if isnull(l_0_0) then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
mp.set_mpattribute("SLF:Trojan:Win32/SuspGolang.MN")
return mp.LOWFI
