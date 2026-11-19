-- Threat: !InfrastructureShared
-- Name: 2a7857d5e09c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
