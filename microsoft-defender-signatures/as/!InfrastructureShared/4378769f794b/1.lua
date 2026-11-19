-- Threat: !InfrastructureShared
-- Name: 4378769f794b
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
