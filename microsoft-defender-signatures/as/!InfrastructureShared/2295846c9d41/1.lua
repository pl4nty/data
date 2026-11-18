-- Threat: !InfrastructureShared
-- Name: 2295846c9d41
-- Type: 21

if mp.get_mpattribute("PEBMPAT:Virus:Win32/Xpaj.gen!F") then
  return mp.INFECTED
end
return mp.CLEAN
