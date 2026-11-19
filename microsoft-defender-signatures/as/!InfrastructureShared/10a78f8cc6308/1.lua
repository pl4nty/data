-- Threat: !InfrastructureShared
-- Name: 10a78f8cc6308
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
