-- Threat: !InfrastructureShared
-- Name: 46786e635352
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
