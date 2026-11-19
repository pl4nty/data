-- Threat: !InfrastructureShared
-- Name: 1e7788aa2cdf0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
