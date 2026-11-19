-- Threat: !InfrastructureShared
-- Name: 2978112ece8b
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
