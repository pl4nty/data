-- Threat: !InfrastructureShared
-- Name: 257878bc8669
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
