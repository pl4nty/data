-- Threat: !InfrastructureShared
-- Name: 11878fa12c685
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
