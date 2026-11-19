-- Threat: !InfrastructureShared
-- Name: 4578b28552d8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
