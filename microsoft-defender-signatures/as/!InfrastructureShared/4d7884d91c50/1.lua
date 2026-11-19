-- Threat: !InfrastructureShared
-- Name: 4d7884d91c50
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
