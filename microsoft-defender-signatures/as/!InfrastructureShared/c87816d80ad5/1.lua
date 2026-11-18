-- Threat: !InfrastructureShared
-- Name: c87816d80ad5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
