-- Threat: !InfrastructureShared
-- Name: 106787cfcdabd
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
