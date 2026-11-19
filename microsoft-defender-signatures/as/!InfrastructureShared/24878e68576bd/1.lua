-- Threat: !InfrastructureShared
-- Name: 24878e68576bd
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
