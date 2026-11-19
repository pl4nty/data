-- Threat: !InfrastructureShared
-- Name: 12c781133497f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
