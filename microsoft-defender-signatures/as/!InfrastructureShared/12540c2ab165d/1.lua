-- Threat: !InfrastructureShared
-- Name: 12540c2ab165d
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
