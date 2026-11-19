-- Threat: !InfrastructureShared
-- Name: 727811420091
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
