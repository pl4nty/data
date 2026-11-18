-- Threat: !InfrastructureShared
-- Name: 1e54056d06872
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
