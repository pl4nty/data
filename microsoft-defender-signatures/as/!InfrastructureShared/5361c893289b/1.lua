-- Threat: !InfrastructureShared
-- Name: 5361c893289b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
