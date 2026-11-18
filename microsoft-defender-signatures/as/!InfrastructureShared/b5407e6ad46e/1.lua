-- Threat: !InfrastructureShared
-- Name: b5407e6ad46e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
