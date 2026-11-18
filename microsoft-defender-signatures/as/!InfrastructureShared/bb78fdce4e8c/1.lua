-- Threat: !InfrastructureShared
-- Name: bb78fdce4e8c
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
