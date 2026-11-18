-- Threat: !InfrastructureShared
-- Name: 5f78b16557f6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
