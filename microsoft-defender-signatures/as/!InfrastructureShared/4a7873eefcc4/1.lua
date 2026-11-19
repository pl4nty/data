-- Threat: !InfrastructureShared
-- Name: 4a7873eefcc4
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
