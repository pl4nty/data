-- Threat: !InfrastructureShared
-- Name: 6d78794c6a9c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
