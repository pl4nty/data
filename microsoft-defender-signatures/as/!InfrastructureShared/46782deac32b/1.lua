-- Threat: !InfrastructureShared
-- Name: 46782deac32b
-- Type: 21

local l_0_0 = mp.getfilesize()
if (peattributes.isexe or peattributes.isdll) and 5242880 < l_0_0 and l_0_0 < 8388608 then
  return mp.INFECTED
end
return mp.CLEAN
