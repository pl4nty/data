-- Threat: !InfrastructureShared
-- Name: 6d78942c88dd
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
