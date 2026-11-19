-- Threat: !InfrastructureShared
-- Name: 8478b027081a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
