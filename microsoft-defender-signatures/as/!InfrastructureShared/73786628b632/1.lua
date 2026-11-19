-- Threat: !InfrastructureShared
-- Name: 73786628b632
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
