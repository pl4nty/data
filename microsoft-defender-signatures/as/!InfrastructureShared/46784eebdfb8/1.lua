-- Threat: !InfrastructureShared
-- Name: 46784eebdfb8
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
