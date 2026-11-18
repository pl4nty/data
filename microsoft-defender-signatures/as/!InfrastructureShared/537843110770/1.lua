-- Threat: !InfrastructureShared
-- Name: 537843110770
-- Type: 21

if peattributes.isdll == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
