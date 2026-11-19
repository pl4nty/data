-- Threat: !InfrastructureShared
-- Name: 7f788d0c92f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
