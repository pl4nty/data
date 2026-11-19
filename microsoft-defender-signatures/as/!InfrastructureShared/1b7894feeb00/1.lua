-- Threat: !InfrastructureShared
-- Name: 1b7894feeb00
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
