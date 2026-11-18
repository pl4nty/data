-- Threat: !InfrastructureShared
-- Name: 4f78524f1acb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
