-- Threat: !InfrastructureShared
-- Name: a540b88abb8d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
