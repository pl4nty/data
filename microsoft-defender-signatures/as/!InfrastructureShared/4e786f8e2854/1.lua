-- Threat: !InfrastructureShared
-- Name: 4e786f8e2854
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
