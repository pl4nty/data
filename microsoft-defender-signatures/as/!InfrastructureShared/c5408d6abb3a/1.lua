-- Threat: !InfrastructureShared
-- Name: c5408d6abb3a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
