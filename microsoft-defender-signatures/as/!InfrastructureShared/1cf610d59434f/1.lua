-- Threat: !InfrastructureShared
-- Name: 1cf610d59434f
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 393216 <= l_0_0 and l_0_0 <= 5111808 then
  return mp.INFECTED
end
return mp.CLEAN
