-- Threat: !InfrastructureShared
-- Name: 4e783059f946
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
