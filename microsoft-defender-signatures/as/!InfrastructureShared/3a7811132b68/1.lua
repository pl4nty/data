-- Threat: !InfrastructureShared
-- Name: 3a7811132b68
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
