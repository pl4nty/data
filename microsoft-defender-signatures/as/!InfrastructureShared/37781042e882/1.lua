-- Threat: !InfrastructureShared
-- Name: 37781042e882
-- Type: 21

local l_0_0 = mp.getfilesize()
if mp.get_mpattribute("NID:Win64/Qakbot.PAN!MTB") and 131072 < l_0_0 and l_0_0 < 327680 then
  return mp.INFECTED
end
return mp.CLEAN
