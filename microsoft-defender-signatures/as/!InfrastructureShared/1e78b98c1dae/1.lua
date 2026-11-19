-- Threat: !InfrastructureShared
-- Name: 1e78b98c1dae
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
