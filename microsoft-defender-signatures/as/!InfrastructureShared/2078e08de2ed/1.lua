-- Threat: !InfrastructureShared
-- Name: 2078e08de2ed
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
