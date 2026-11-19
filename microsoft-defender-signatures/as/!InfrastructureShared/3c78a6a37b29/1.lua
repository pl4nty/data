-- Threat: !InfrastructureShared
-- Name: 3c78a6a37b29
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 77824 <= l_0_0 and l_0_0 <= 90112 and peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
