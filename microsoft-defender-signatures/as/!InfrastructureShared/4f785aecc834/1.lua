-- Threat: !InfrastructureShared
-- Name: 4f785aecc834
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
