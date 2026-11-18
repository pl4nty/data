-- Threat: !InfrastructureShared
-- Name: 17540c769a93f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
