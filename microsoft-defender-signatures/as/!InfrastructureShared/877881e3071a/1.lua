-- Threat: !InfrastructureShared
-- Name: 877881e3071a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
