-- Threat: !InfrastructureShared
-- Name: 317837150098
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
