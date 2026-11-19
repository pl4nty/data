-- Threat: !InfrastructureShared
-- Name: 34781d575fa8
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
