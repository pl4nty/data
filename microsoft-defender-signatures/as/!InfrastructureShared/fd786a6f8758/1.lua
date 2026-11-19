-- Threat: !InfrastructureShared
-- Name: fd786a6f8758
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
