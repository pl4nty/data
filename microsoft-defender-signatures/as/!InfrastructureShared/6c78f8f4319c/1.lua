-- Threat: !InfrastructureShared
-- Name: 6c78f8f4319c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
