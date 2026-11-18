-- Threat: !InfrastructureShared
-- Name: d87881b68a53
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll and peattributes.no_security and 663552 < l_0_0 and l_0_0 < 671744 then
  return mp.INFECTED
end
return mp.CLEAN
