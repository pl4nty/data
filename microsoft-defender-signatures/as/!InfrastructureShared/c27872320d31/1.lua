-- Threat: !InfrastructureShared
-- Name: c27872320d31
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 924832 then
  return mp.INFECTED
end
return mp.CLEAN
