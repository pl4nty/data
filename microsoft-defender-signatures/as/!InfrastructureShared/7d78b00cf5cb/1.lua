-- Threat: !InfrastructureShared
-- Name: 7d78b00cf5cb
-- Type: 21

local l_0_0 = mp.getfilesize()
if 327680 <= l_0_0 and l_0_0 <= 360448 and mp.get_mpattribute("NID:Win32/IcedId.PK!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
