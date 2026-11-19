-- Threat: !InfrastructureShared
-- Name: 5b78d64e137c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
