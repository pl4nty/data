-- Threat: !InfrastructureShared
-- Name: 16540b5dcb0c8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
