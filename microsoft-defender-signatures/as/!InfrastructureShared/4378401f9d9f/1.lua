-- Threat: !InfrastructureShared
-- Name: 4378401f9d9f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
