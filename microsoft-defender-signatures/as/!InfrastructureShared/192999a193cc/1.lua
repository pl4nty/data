-- Threat: !InfrastructureShared
-- Name: 192999a193cc
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 4000 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find(".bin", 1, true) or l_0_1:find("\\payload", 1, true) or l_0_1:find("\\loader", 1, true) or l_0_1:find("\\sbx", 1, true) or l_0_1:find("\\sbe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
