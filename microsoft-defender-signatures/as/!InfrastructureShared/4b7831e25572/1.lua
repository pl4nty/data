-- Threat: !InfrastructureShared
-- Name: 4b7831e25572
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
