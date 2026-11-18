-- Threat: !InfrastructureShared
-- Name: c778c51c200b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
