-- Threat: !InfrastructureShared
-- Name: 3b78046f9cd7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
