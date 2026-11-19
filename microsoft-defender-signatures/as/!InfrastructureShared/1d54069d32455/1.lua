-- Threat: !InfrastructureShared
-- Name: 1d54069d32455
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
