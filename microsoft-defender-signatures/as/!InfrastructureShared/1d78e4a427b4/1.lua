-- Threat: !InfrastructureShared
-- Name: 1d78e4a427b4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
