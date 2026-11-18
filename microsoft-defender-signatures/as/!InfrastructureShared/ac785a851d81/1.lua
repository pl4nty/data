-- Threat: !InfrastructureShared
-- Name: ac785a851d81
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
