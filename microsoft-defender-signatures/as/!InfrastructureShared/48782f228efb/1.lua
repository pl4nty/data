-- Threat: !InfrastructureShared
-- Name: 48782f228efb
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
