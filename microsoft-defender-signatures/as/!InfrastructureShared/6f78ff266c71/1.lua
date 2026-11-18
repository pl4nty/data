-- Threat: !InfrastructureShared
-- Name: 6f78ff266c71
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
