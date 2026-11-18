-- Threat: !InfrastructureShared
-- Name: 2d780eeec354
-- Type: 21

if mp.get_mpattribute("SIGATTR:RunsTempBat") then
  return mp.INFECTED
end
return mp.CLEAN
