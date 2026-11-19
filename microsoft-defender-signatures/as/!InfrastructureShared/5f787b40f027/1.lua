-- Threat: !InfrastructureShared
-- Name: 5f787b40f027
-- Type: 21

if mp.get_mpattribute("NID:Win64/DarkRat.PA") and peattributes.no_security == true and mp.getfilesize() >= 230000 and mp.getfilesize() <= 260000 then
  return mp.INFECTED
end
return mp.CLEAN
