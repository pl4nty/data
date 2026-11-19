-- Threat: !InfrastructureShared
-- Name: b578daf98cb6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
