-- Threat: !InfrastructureShared
-- Name: 37618d55a1f9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
