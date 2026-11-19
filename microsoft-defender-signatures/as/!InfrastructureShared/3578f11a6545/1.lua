-- Threat: !InfrastructureShared
-- Name: 3578f11a6545
-- Type: 21

if peattributes.ismsil == true and hstrlog[4].hitcount >= 50 then
  return mp.INFECTED
end
return mp.CLEAN
