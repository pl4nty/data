-- Threat: !InfrastructureShared
-- Name: cc7849c4bf23
-- Type: 21

local l_0_0 = mp.getfilesize()
if 196608 <= l_0_0 and l_0_0 <= 327680 and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
