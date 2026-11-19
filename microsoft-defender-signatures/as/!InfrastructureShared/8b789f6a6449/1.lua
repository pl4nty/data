-- Threat: !InfrastructureShared
-- Name: 8b789f6a6449
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
