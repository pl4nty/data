-- Threat: !InfrastructureShared
-- Name: 6e78762eac9f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
