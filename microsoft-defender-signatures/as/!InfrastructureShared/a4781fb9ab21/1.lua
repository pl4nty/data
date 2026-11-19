-- Threat: !InfrastructureShared
-- Name: a4781fb9ab21
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 131072 <= l_0_0 and l_0_0 <= 139264 and (pehdr.NumberOfSections >= 6 or pehdr.NumberOfSections <= 9) and (pesecs[1].VirtualSize > 8192 or pesecs[1].VirtualSize < 12288) then
  return mp.INFECTED
end
return mp.CLEAN
