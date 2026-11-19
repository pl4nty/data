-- Threat: !InfrastructureShared
-- Name: 2b78165d2ad1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
