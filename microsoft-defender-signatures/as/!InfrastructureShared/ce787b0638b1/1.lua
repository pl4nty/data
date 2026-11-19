-- Threat: !InfrastructureShared
-- Name: ce787b0638b1
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
