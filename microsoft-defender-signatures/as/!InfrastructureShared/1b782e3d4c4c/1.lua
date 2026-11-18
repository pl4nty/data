-- Threat: !InfrastructureShared
-- Name: 1b782e3d4c4c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
