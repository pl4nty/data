-- Threat: !InfrastructureShared
-- Name: 73785a5475a3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
