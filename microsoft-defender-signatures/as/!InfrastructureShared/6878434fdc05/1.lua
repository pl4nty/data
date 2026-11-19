-- Threat: !InfrastructureShared
-- Name: 6878434fdc05
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
