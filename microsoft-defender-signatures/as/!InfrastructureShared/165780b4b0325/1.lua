-- Threat: !InfrastructureShared
-- Name: 165780b4b0325
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
