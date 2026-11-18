-- Threat: !InfrastructureShared
-- Name: 6978e58c4053
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
