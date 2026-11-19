-- Threat: !InfrastructureShared
-- Name: 7b78602998b5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
