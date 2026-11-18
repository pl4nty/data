-- Threat: !InfrastructureShared
-- Name: 1e78c07dd265
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
