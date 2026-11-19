-- Threat: !InfrastructureShared
-- Name: ce782d2b126f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
