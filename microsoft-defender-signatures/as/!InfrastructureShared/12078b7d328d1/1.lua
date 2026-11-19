-- Threat: !InfrastructureShared
-- Name: 12078b7d328d1
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 8 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:TrojanProxy:Win32/Banker.AU")
return mp.LOWFI
