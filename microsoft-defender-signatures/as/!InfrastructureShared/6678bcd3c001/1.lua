-- Threat: !InfrastructureShared
-- Name: 6678bcd3c001
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
