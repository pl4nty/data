-- Threat: !InfrastructureShared
-- Name: 2f78a3a27039
-- Type: 21

if (peattributes.isvbpcode == true or peattributes.isvbnative == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
