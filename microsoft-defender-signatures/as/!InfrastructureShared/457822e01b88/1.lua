-- Threat: !InfrastructureShared
-- Name: 457822e01b88
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
