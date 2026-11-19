-- Threat: !InfrastructureShared
-- Name: 3c781e06694c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
