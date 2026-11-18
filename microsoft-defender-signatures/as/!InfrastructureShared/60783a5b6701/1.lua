-- Threat: !InfrastructureShared
-- Name: 60783a5b6701
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
