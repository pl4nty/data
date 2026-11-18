-- Threat: !InfrastructureShared
-- Name: 41615d938fbf
-- Type: 21

local l_0_0 = mp.getfilesize()
if 5120 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename(mp.FILEPATH_QUERY_FNAME))
if l_0_1 == "cnqmutil.dll" then
  return mp.INFECTED
end
return mp.CLEAN
