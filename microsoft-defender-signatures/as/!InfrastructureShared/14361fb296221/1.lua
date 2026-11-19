-- Threat: !InfrastructureShared
-- Name: 14361fb296221
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
