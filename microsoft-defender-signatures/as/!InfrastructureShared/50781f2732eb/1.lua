-- Threat: !InfrastructureShared
-- Name: 50781f2732eb
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
