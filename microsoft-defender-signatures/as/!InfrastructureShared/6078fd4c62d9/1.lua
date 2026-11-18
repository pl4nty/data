-- Threat: !InfrastructureShared
-- Name: 6078fd4c62d9
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
