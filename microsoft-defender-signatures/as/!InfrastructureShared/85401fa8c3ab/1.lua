-- Threat: !InfrastructureShared
-- Name: 85401fa8c3ab
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
