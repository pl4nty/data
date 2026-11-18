-- Threat: !InfrastructureShared
-- Name: d9783f93cdf4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
