-- Threat: !InfrastructureShared
-- Name: 4c78171d8208
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
