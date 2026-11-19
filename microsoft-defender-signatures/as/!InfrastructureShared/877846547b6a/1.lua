-- Threat: !InfrastructureShared
-- Name: 877846547b6a
-- Type: 21

if peattributes.isexe == true or peattributes.isdriver == true then
  return mp.INFECTED
end
return mp.CLEAN
