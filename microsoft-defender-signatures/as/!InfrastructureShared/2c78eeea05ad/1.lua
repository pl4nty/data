-- Threat: !InfrastructureShared
-- Name: 2c78eeea05ad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
