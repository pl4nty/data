-- Threat: !InfrastructureShared
-- Name: 1e78b9c9353e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
