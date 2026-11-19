-- Threat: !InfrastructureShared
-- Name: 99788d4fe88f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
