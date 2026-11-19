-- Threat: !InfrastructureShared
-- Name: 4f78a717cf1b
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
