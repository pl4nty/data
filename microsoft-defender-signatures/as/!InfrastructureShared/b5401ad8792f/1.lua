-- Threat: !InfrastructureShared
-- Name: b5401ad8792f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
