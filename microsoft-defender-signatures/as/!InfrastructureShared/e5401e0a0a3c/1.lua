-- Threat: !InfrastructureShared
-- Name: e5401e0a0a3c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
