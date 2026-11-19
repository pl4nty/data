-- Threat: !InfrastructureShared
-- Name: 31296457623a
-- Type: 21

local l_0_0 = mp.get_mpattribute("MpInternal_researchdata=GearHintContentSource=Email")
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
