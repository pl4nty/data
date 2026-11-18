-- Threat: !InfrastructureShared
-- Name: 43780f09ac49
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
