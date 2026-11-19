-- Threat: !InfrastructureShared
-- Name: b378e4d0fd3c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll and peattributes.no_security and 671744 < l_0_0 and l_0_0 < 680000 then
  return mp.INFECTED
end
return mp.CLEAN
