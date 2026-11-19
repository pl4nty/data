-- Threat: !InfrastructureShared
-- Name: 41789446c6fd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
