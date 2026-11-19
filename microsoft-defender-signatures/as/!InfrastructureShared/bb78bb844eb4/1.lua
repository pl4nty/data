-- Threat: !InfrastructureShared
-- Name: bb78bb844eb4
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
