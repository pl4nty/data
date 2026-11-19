-- Threat: !InfrastructureShared
-- Name: 9178620c74ca
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
