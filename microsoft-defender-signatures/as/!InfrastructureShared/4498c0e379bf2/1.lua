-- Threat: !InfrastructureShared
-- Name: 4498c0e379bf2
-- Type: 21

local l_0_0 = mp.getfilesize()
if 8000000 < l_0_0 or l_0_0 < 10000 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("mkvie-porting-working", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("slurm", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
