-- Threat: !InfrastructureShared
-- Name: ae78a532ed6d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetHSTRCallerId()
if isnull(l_0_0) then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
mp.set_mpattribute("SLF:HackTool:Win32/NapiCOFFLoader.A")
return mp.LOWFI
