-- Threat: !InfrastructureShared
-- Name: 2f787fdd6994
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
