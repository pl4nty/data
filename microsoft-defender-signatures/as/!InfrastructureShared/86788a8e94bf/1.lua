-- Threat: !InfrastructureShared
-- Name: 86788a8e94bf
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 118784 <= l_0_0 and l_0_0 <= 139264 and (pehdr.NumberOfSections >= 6 or pehdr.NumberOfSections <= 8) then
  return mp.INFECTED
end
return mp.CLEAN
