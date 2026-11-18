-- Threat: !InfrastructureShared
-- Name: 5f7885123bce
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
