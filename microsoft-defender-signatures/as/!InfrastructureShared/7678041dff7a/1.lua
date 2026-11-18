-- Threat: !InfrastructureShared
-- Name: 7678041dff7a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
