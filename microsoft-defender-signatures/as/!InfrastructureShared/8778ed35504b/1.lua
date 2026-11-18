-- Threat: !InfrastructureShared
-- Name: 8778ed35504b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 196608 <= l_0_0 and l_0_0 <= 393216 and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
