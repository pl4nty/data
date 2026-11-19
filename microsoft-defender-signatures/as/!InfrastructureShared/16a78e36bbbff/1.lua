-- Threat: !InfrastructureShared
-- Name: 16a78e36bbbff
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
