-- Threat: !InfrastructureShared
-- Name: 12478e30c78c1
-- Type: 21

local l_0_0 = mp.getfilesize()
if 4096 <= l_0_0 and l_0_0 <= 16384 and peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
