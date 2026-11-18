-- Threat: !InfrastructureShared
-- Name: 1a27883007b1f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
