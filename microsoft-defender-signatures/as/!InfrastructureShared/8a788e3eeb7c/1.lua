-- Threat: !InfrastructureShared
-- Name: 8a788e3eeb7c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
