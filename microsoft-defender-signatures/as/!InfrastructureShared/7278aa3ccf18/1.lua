-- Threat: !InfrastructureShared
-- Name: 7278aa3ccf18
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
