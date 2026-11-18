-- Threat: !InfrastructureShared
-- Name: a178583c4f4b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
