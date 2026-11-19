-- Threat: !InfrastructureShared
-- Name: aa78f8952a8c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
