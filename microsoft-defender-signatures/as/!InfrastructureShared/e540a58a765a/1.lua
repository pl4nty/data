-- Threat: !InfrastructureShared
-- Name: e540a58a765a
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
