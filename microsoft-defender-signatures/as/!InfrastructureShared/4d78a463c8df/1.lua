-- Threat: !InfrastructureShared
-- Name: 4d78a463c8df
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
