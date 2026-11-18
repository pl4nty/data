-- Threat: !InfrastructureShared
-- Name: bc78276c0f60
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
