-- Threat: !InfrastructureShared
-- Name: e261eeaf79ce
-- Type: 21

if peattributes.no_security == false then
  return mp.INFECTED
end
return mp.CLEAN
