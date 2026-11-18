-- Threat: !InfrastructureShared
-- Name: 18783970b529
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
