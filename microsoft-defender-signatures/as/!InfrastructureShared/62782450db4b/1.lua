-- Threat: !InfrastructureShared
-- Name: 62782450db4b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
