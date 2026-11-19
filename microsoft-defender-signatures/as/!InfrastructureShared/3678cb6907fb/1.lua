-- Threat: !InfrastructureShared
-- Name: 3678cb6907fb
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 192512 <= l_0_0 and l_0_0 <= 229376 and peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
