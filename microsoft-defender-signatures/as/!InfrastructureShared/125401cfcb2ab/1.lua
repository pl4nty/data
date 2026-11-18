-- Threat: !InfrastructureShared
-- Name: 125401cfcb2ab
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
