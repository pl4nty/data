-- Threat: !InfrastructureShared
-- Name: a54065e0a727
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
