-- Threat: !InfrastructureShared
-- Name: 2178c30c61f2
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
