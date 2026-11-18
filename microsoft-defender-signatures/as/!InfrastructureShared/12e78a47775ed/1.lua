-- Threat: !InfrastructureShared
-- Name: 12e78a47775ed
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
