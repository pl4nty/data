-- Threat: !InfrastructureShared
-- Name: 4b785c5e7e09
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
