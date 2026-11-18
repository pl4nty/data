-- Threat: !InfrastructureShared
-- Name: 77781e46e255
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
