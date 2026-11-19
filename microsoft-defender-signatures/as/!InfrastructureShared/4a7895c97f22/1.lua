-- Threat: !InfrastructureShared
-- Name: 4a7895c97f22
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
