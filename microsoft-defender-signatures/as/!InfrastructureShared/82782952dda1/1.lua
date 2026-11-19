-- Threat: !InfrastructureShared
-- Name: 82782952dda1
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
