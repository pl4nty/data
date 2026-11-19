-- Threat: !InfrastructureShared
-- Name: 20787c2f7054
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
