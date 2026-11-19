-- Threat: !InfrastructureShared
-- Name: 16540959b1206
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
