-- Threat: !InfrastructureShared
-- Name: a878bd769db8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
