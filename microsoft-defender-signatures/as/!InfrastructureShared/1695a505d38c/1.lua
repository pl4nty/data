-- Threat: !InfrastructureShared
-- Name: 1695a505d38c
-- Type: 21

if mp.get_mpattribute("PEBMPAT:Virus:Win32/Xpaj.gen!F") then
  return mp.INFECTED
end
return mp.CLEAN
