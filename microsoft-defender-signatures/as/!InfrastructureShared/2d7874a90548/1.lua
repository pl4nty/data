-- Threat: !InfrastructureShared
-- Name: 2d7874a90548
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
