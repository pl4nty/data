-- Threat: !InfrastructureShared
-- Name: 727873aa9168
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
