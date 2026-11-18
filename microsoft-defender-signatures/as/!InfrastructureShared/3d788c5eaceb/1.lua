-- Threat: !InfrastructureShared
-- Name: 3d788c5eaceb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
