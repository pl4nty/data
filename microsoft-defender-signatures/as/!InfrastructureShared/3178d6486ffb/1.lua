-- Threat: !InfrastructureShared
-- Name: 3178d6486ffb
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
