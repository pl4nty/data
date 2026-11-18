-- Threat: !InfrastructureShared
-- Name: 988c47df2028
-- Type: 21

local l_0_0 = mp.getfilesize()
if 5100 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
