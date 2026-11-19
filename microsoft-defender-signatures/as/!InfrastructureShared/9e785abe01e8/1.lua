-- Threat: !InfrastructureShared
-- Name: 9e785abe01e8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
