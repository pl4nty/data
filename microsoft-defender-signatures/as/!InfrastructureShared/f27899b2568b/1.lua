-- Threat: !InfrastructureShared
-- Name: f27899b2568b
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
