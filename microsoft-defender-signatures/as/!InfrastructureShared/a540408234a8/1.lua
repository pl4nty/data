-- Threat: !InfrastructureShared
-- Name: a540408234a8
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
