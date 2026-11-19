-- Threat: !InfrastructureShared
-- Name: 4f78952c193a
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
