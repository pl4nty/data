-- Threat: !InfrastructureShared
-- Name: 64784b86624a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
