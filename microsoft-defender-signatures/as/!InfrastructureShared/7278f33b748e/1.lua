-- Threat: !InfrastructureShared
-- Name: 7278f33b748e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
