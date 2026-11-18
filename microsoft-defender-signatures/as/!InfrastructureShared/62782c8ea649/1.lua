-- Threat: !InfrastructureShared
-- Name: 62782c8ea649
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
