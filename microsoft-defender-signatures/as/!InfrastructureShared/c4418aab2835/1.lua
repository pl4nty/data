-- Threat: !InfrastructureShared
-- Name: c4418aab2835
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
