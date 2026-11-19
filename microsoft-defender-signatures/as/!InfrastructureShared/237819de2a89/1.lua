-- Threat: !InfrastructureShared
-- Name: 237819de2a89
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
