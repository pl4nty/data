-- Threat: !InfrastructureShared
-- Name: 3d78f441b034
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
