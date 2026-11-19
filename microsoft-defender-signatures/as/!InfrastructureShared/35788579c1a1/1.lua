-- Threat: !InfrastructureShared
-- Name: 35788579c1a1
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
