-- Threat: !InfrastructureShared
-- Name: a540f0ea856c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
