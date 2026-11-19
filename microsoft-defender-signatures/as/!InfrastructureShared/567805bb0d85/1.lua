-- Threat: !InfrastructureShared
-- Name: 567805bb0d85
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
