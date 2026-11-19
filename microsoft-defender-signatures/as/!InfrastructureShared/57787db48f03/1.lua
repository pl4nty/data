-- Threat: !InfrastructureShared
-- Name: 57787db48f03
-- Type: 21

local l_0_0 = mp.getfilesize()
if mp.get_mpattribute("HSTR:GolangBinary") and 5242880 < l_0_0 and l_0_0 < 15728640 then
  return mp.INFECTED
end
return mp.CLEAN
