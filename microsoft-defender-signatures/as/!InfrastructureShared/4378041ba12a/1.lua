-- Threat: !InfrastructureShared
-- Name: 4378041ba12a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
