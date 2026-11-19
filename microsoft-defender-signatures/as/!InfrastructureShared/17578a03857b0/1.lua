-- Threat: !InfrastructureShared
-- Name: 17578a03857b0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
