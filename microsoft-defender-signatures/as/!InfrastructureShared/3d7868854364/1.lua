-- Threat: !InfrastructureShared
-- Name: 3d7868854364
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
