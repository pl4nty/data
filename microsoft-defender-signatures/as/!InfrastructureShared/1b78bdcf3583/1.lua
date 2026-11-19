-- Threat: !InfrastructureShared
-- Name: 1b78bdcf3583
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
