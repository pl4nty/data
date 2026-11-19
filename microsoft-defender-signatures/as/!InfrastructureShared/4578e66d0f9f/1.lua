-- Threat: !InfrastructureShared
-- Name: 4578e66d0f9f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
