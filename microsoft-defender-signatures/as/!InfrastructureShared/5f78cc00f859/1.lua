-- Threat: !InfrastructureShared
-- Name: 5f78cc00f859
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
