-- Threat: !InfrastructureShared
-- Name: 4d78fb1af856
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
