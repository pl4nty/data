-- Threat: !InfrastructureShared
-- Name: 297848a0d377
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
