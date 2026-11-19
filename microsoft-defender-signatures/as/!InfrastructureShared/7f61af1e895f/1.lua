-- Threat: !InfrastructureShared
-- Name: 7f61af1e895f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
