-- Threat: !InfrastructureShared
-- Name: 8b78b19e24bf
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
