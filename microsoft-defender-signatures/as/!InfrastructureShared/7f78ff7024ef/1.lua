-- Threat: !InfrastructureShared
-- Name: 7f78ff7024ef
-- Type: 21
-- Includes: HstrLuaLib

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  reportDetectedRegions()
  return mp.INFECTED
end
mp.set_mpattribute("SLF:Win64/BruterShell.A")
return mp.LOWFI
