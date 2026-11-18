-- Threat: !InfrastructureShared
-- Name: 5c781bae8c72
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
