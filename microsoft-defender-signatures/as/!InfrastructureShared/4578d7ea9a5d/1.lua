-- Threat: !InfrastructureShared
-- Name: 4578d7ea9a5d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
