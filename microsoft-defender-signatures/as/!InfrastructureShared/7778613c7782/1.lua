-- Threat: !InfrastructureShared
-- Name: 7778613c7782
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
