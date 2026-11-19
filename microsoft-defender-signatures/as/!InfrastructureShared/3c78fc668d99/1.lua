-- Threat: !InfrastructureShared
-- Name: 3c78fc668d99
-- Type: 21

local l_0_0 = mp.getfilesize()
if mp.get_mpattribute("HSTR:GolangBinary") and 6291456 < l_0_0 and l_0_0 < 8388608 then
  return mp.INFECTED
end
return mp.CLEAN
