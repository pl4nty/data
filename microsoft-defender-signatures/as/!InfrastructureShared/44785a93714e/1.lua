-- Threat: !InfrastructureShared
-- Name: 44785a93714e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
