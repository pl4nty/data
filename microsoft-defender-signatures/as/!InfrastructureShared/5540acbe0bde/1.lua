-- Threat: !InfrastructureShared
-- Name: 5540acbe0bde
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
