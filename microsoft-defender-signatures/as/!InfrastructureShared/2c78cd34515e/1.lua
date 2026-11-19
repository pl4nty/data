-- Threat: !InfrastructureShared
-- Name: 2c78cd34515e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
