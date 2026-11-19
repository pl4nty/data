-- Threat: !InfrastructureShared
-- Name: 33780ecaf14b
-- Type: 21

local l_0_0 = mp.getfilesize()
if mp.get_mpattribute("NID:PossibleParadiseSh") and peattributes.no_security == true and l_0_0 <= 8704 and 7680 <= l_0_0 and peattributes.isdll == false and pehdr.NumberOfSections == 4 then
  return mp.INFECTED
end
return mp.CLEAN
