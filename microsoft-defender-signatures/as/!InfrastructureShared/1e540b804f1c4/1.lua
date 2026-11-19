-- Threat: !InfrastructureShared
-- Name: 1e540b804f1c4
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\program files", 1, true) then
  return mp.CLEAN
end
mp.set_mpattribute("BM_IISMODULE")
return mp.INFECTED
