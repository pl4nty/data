-- Threat: !InfrastructureShared
-- Name: b5786b8d8af2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
