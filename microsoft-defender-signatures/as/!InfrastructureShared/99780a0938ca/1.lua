-- Threat: !InfrastructureShared
-- Name: 99780a0938ca
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
