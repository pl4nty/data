-- Threat: !InfrastructureShared
-- Name: 4540f5630ffa
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
