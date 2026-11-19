-- Threat: !InfrastructureShared
-- Name: 1ed7891077e13
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
