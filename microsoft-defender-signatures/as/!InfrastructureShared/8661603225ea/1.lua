-- Threat: !InfrastructureShared
-- Name: 8661603225ea
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
