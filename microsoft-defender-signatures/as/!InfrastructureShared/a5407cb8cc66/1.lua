-- Threat: !InfrastructureShared
-- Name: a5407cb8cc66
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
