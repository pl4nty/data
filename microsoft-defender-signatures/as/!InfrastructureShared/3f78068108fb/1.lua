-- Threat: !InfrastructureShared
-- Name: 3f78068108fb
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
