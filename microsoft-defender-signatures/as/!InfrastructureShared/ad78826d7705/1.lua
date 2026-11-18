-- Threat: !InfrastructureShared
-- Name: ad78826d7705
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
