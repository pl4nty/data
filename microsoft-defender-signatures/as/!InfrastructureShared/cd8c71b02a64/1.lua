-- Threat: !InfrastructureShared
-- Name: cd8c71b02a64
-- Type: 21

local l_0_0 = mp.getfilesize()
if mp.HSTR_WEIGHT >= 6 and l_0_0 < 2097152 then
  return mp.INFECTED
end
return mp.CLEAN
