-- Threat: !InfrastructureShared
-- Name: 4b785e7c83b4
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
