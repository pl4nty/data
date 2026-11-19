-- Threat: !InfrastructureShared
-- Name: 7778fcb989e5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
