-- Threat: !InfrastructureShared
-- Name: 8e782403d520
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
