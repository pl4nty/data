-- Threat: !InfrastructureShared
-- Name: 70781d50487e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
