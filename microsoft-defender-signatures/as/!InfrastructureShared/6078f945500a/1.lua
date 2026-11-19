-- Threat: !InfrastructureShared
-- Name: 6078f945500a
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
