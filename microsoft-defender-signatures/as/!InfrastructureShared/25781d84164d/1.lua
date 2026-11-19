-- Threat: !InfrastructureShared
-- Name: 25781d84164d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
