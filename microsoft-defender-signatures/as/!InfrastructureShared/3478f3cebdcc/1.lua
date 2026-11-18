-- Threat: !InfrastructureShared
-- Name: 3478f3cebdcc
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
