-- Threat: !InfrastructureShared
-- Name: 4d788310e54c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
