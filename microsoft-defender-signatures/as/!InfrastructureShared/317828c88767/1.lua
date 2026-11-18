-- Threat: !InfrastructureShared
-- Name: 317828c88767
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
