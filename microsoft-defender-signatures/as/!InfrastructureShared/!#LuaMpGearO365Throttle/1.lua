-- Threat: !InfrastructureShared
-- Name: !#Lua:MpGearO365Throttle
-- Type: 12

local l_0_0 = mp.get_mpattribute("MpInternal_researchdata=GearHintContentSource=Email")
if l_0_0 then
  mp.set_mpattribute("Lua:MpGearO365")
  mp.set_mpattribute("InO365")
end
return mp.CLEAN
