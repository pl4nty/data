-- Threat: !InfrastructureShared
-- Name: 22785c441fdd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
