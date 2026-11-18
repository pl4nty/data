-- Threat: !InfrastructureShared
-- Name: 7378e7bcc90e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
