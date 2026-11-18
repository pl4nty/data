-- Threat: !InfrastructureShared
-- Name: 4f786a6ad104
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
