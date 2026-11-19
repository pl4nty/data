-- Threat: !InfrastructureShared
-- Name: 8378ea597bc5
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
