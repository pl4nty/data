-- Threat: !InfrastructureShared
-- Name: 8c78afa5db0b
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and mp.get_mpattribute("NID:Win64/IcedId.PAH!MTB") and 1572864 < l_0_0 and l_0_0 < 1638400 then
  return mp.INFECTED
end
return mp.CLEAN
