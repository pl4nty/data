-- Threat: !InfrastructureShared
-- Name: 5778e77b324c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
