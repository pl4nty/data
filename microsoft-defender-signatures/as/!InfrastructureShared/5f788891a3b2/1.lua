-- Threat: !InfrastructureShared
-- Name: 5f788891a3b2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
