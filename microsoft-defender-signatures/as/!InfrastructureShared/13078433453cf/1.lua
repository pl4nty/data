-- Threat: !InfrastructureShared
-- Name: 13078433453cf
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
