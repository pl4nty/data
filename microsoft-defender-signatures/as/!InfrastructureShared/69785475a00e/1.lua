-- Threat: !InfrastructureShared
-- Name: 69785475a00e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
