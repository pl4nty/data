-- Threat: !InfrastructureShared
-- Name: 6478e9bbd8b8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
