-- Threat: !InfrastructureShared
-- Name: 16e78d62c4787
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
