-- Threat: !InfrastructureShared
-- Name: 4878055e7f80
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
