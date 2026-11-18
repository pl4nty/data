-- Threat: !InfrastructureShared
-- Name: 2354054e8eaf6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
