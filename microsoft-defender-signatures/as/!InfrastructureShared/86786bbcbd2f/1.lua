-- Threat: !InfrastructureShared
-- Name: 86786bbcbd2f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
