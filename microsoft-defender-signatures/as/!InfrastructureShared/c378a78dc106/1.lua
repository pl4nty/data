-- Threat: !InfrastructureShared
-- Name: c378a78dc106
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
