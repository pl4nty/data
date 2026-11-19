-- Threat: !InfrastructureShared
-- Name: 3a787e854f20
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
