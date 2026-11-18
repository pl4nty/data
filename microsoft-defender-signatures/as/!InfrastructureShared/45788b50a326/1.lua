-- Threat: !InfrastructureShared
-- Name: 45788b50a326
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
