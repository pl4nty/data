-- Threat: !InfrastructureShared
-- Name: 2b78813aa3f0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
