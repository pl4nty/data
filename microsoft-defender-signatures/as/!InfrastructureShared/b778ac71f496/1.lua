-- Threat: !InfrastructureShared
-- Name: b778ac71f496
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 155648 <= l_0_0 and l_0_0 <= 204800 and (pehdr.NumberOfSections >= 6 or pehdr.NumberOfSections <= 7) and (pesecs[1].VirtualSize > 106496 or pesecs[1].VirtualSize < 118784) then
  return mp.INFECTED
end
return mp.CLEAN
