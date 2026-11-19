-- Threat: !InfrastructureShared
-- Name: 7b78364da43a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
