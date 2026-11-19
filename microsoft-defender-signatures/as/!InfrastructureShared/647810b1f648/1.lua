-- Threat: !InfrastructureShared
-- Name: 647810b1f648
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
