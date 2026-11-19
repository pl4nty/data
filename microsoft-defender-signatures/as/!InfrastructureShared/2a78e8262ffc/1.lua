-- Threat: !InfrastructureShared
-- Name: 2a78e8262ffc
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
