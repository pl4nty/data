-- Threat: !InfrastructureShared
-- Name: 5e7877e8b4ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
