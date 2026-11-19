-- Threat: !InfrastructureShared
-- Name: 1e778245b7e44
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
