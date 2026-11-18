-- Threat: !InfrastructureShared
-- Name: 427849bd26a1
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
