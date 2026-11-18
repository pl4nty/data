-- Threat: !InfrastructureShared
-- Name: 8478fd1e506a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
