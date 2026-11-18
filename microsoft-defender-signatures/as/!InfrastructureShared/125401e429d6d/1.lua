-- Threat: !InfrastructureShared
-- Name: 125401e429d6d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
