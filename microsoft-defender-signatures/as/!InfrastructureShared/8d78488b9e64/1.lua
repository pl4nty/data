-- Threat: !InfrastructureShared
-- Name: 8d78488b9e64
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
