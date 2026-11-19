-- Threat: !InfrastructureShared
-- Name: 3978eac2c1cb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
