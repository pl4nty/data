-- Threat: !InfrastructureShared
-- Name: 73786cf4e400
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
