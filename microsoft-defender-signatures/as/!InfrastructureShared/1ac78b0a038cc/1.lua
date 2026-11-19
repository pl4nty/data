-- Threat: !InfrastructureShared
-- Name: 1ac78b0a038cc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
