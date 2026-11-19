-- Threat: !InfrastructureShared
-- Name: 38780c50d726
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
