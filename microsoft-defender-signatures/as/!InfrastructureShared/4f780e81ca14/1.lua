-- Threat: !InfrastructureShared
-- Name: 4f780e81ca14
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
