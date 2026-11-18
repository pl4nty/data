-- Threat: !InfrastructureShared
-- Name: 15b789ea53780
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
