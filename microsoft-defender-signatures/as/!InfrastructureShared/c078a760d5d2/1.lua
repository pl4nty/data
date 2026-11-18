-- Threat: !InfrastructureShared
-- Name: c078a760d5d2
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
