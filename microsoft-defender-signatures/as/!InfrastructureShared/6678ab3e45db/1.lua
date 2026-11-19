-- Threat: !InfrastructureShared
-- Name: 6678ab3e45db
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
