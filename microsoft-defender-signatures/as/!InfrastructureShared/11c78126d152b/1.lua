-- Threat: !InfrastructureShared
-- Name: 11c78126d152b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
