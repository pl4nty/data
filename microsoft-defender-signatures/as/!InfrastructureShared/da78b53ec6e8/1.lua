-- Threat: !InfrastructureShared
-- Name: da78b53ec6e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
