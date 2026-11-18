-- Threat: !InfrastructureShared
-- Name: 7378215d24f5
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
