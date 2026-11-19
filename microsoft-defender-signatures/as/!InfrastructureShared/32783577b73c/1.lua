-- Threat: !InfrastructureShared
-- Name: 32783577b73c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
