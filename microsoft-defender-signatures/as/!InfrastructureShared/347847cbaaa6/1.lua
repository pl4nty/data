-- Threat: !InfrastructureShared
-- Name: 347847cbaaa6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
