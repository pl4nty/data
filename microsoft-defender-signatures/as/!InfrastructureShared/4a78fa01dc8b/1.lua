-- Threat: !InfrastructureShared
-- Name: 4a78fa01dc8b
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
