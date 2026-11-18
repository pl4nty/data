-- Threat: !InfrastructureShared
-- Name: 8e6169aac992
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
