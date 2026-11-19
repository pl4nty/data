-- Threat: !InfrastructureShared
-- Name: 1554028f0f52b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
