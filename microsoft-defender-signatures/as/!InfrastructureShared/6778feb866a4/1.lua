-- Threat: !InfrastructureShared
-- Name: 6778feb866a4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
