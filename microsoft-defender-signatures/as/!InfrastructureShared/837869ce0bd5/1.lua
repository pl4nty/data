-- Threat: !InfrastructureShared
-- Name: 837869ce0bd5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
