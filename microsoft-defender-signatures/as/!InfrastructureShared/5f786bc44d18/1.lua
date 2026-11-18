-- Threat: !InfrastructureShared
-- Name: 5f786bc44d18
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
