-- Threat: !InfrastructureShared
-- Name: 5b780d5f9fd3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
