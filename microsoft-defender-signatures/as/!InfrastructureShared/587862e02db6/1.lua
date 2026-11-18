-- Threat: !InfrastructureShared
-- Name: 587862e02db6
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
