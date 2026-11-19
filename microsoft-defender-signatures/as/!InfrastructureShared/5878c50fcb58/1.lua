-- Threat: !InfrastructureShared
-- Name: 5878c50fcb58
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
