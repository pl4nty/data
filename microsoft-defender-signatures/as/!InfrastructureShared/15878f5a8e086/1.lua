-- Threat: !InfrastructureShared
-- Name: 15878f5a8e086
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
