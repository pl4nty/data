-- Threat: !InfrastructureShared
-- Name: b8781d4149c6
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll and peattributes.no_security and 688128 < l_0_0 and l_0_0 < 696320 then
  return mp.INFECTED
end
return mp.CLEAN
