-- Threat: !InfrastructureShared
-- Name: 45781cc3e57b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
