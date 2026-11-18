-- Threat: !InfrastructureShared
-- Name: a87899e5104f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
