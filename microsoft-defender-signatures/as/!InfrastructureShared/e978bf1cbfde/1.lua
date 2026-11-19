-- Threat: !InfrastructureShared
-- Name: e978bf1cbfde
-- Type: 21

if peattributes.isdll and peattributes.x86_image and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
