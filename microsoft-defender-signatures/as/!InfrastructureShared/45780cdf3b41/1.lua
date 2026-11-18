-- Threat: !InfrastructureShared
-- Name: 45780cdf3b41
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
