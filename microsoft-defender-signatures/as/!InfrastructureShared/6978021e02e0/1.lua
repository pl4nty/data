-- Threat: !InfrastructureShared
-- Name: 6978021e02e0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
