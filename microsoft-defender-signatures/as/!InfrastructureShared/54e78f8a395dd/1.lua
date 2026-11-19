-- Threat: !InfrastructureShared
-- Name: 54e78f8a395dd
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:Win32/Banjori.A")
return mp.CLEAN
