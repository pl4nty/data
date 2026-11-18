-- Threat: !InfrastructureShared
-- Name: 42789024a601
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
