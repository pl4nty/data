-- Threat: !InfrastructureShared
-- Name: 2c789c15515f
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
