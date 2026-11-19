-- Threat: !InfrastructureShared
-- Name: 6f78e3879f74
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
