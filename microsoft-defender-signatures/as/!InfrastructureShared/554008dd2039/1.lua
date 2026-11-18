-- Threat: !InfrastructureShared
-- Name: 554008dd2039
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
