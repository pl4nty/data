-- Threat: !InfrastructureShared
-- Name: c578526f47a9
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
