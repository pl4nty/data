-- Threat: !InfrastructureShared
-- Name: 5f78c0d5caab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
