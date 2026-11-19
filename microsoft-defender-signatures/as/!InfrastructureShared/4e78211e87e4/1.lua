-- Threat: !InfrastructureShared
-- Name: 4e78211e87e4
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
