-- Threat: !InfrastructureShared
-- Name: 49615ea30532
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
