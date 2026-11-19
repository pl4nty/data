-- Threat: !InfrastructureShared
-- Name: 2878ae7f4693
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
