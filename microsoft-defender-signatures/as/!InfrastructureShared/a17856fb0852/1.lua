-- Threat: !InfrastructureShared
-- Name: a17856fb0852
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
