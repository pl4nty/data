-- Threat: !InfrastructureShared
-- Name: 14540d5bd2940
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
