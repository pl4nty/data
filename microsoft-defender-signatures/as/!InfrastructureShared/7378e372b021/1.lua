-- Threat: !InfrastructureShared
-- Name: 7378e372b021
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
