-- Threat: !InfrastructureShared
-- Name: 10a78c3c7feee
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
