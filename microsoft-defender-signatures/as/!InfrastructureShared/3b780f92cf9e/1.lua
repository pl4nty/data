-- Threat: !InfrastructureShared
-- Name: 3b780f92cf9e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
