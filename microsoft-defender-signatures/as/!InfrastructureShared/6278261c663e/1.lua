-- Threat: !InfrastructureShared
-- Name: 6278261c663e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
