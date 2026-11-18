-- Threat: !InfrastructureShared
-- Name: ba7887cc8f89
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
