-- Threat: !InfrastructureShared
-- Name: 7278180f4bc0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
