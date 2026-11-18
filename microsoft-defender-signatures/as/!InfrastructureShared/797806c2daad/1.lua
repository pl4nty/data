-- Threat: !InfrastructureShared
-- Name: 797806c2daad
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
mp.set_mpattribute("SLF:Win32/BruterShell.A")
return mp.LOWFI
