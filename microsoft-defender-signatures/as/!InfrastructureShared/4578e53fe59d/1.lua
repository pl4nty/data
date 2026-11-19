-- Threat: !InfrastructureShared
-- Name: 4578e53fe59d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
