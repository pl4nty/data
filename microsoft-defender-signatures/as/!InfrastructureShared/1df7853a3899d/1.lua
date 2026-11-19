-- Threat: !InfrastructureShared
-- Name: 1df7853a3899d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
