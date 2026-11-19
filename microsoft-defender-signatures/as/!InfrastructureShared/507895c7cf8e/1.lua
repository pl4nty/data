-- Threat: !InfrastructureShared
-- Name: 507895c7cf8e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
