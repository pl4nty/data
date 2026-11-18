-- Threat: !InfrastructureShared
-- Name: 257822c31a0d
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
