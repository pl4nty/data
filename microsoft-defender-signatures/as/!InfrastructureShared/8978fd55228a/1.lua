-- Threat: !InfrastructureShared
-- Name: 8978fd55228a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
