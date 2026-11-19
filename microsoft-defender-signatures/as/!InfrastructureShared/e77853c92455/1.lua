-- Threat: !InfrastructureShared
-- Name: e77853c92455
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
