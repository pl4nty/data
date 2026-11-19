-- Threat: !InfrastructureShared
-- Name: 5378104d505c
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
