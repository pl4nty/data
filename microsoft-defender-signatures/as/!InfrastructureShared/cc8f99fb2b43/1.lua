-- Threat: !InfrastructureShared
-- Name: cc8f99fb2b43
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 16777216 then
  return mp.INFECTED
end
return mp.CLEAN
