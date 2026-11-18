-- Threat: !InfrastructureShared
-- Name: 1d782d4d66df
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 118784 <= l_0_0 and l_0_0 <= 139264 and (pehdr.NumberOfSections >= 5 or pehdr.NumberOfSections <= 7) then
  return mp.INFECTED
end
return mp.CLEAN
