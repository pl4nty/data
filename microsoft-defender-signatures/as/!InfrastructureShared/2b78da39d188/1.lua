-- Threat: !InfrastructureShared
-- Name: 2b78da39d188
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
