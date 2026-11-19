-- Threat: !InfrastructureShared
-- Name: 1d61496293df
-- Type: 21

local l_0_0 = mp.getfilesize()
if 49152 <= l_0_0 and l_0_0 <= 57344 and mp.get_mpattribute("NID:Win64/Atosev.PA!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
