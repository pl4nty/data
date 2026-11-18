-- Threat: !InfrastructureShared
-- Name: 5d78ca2b92b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
