-- Threat: !InfrastructureShared
-- Name: 114784b133967
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
