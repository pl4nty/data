-- Threat: !InfrastructureShared
-- Name: 11540c70e3303
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
