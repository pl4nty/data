-- Threat: !InfrastructureShared
-- Name: 57780bed9e54
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
