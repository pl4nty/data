-- Threat: !InfrastructureShared
-- Name: c57878ca676a
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll and peattributes.no_security and 1572864 < l_0_0 and l_0_0 < 1638400 then
  return mp.INFECTED
end
return mp.CLEAN
