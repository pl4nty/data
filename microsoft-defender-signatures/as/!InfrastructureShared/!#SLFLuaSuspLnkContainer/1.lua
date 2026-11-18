-- Threat: !InfrastructureShared
-- Name: !#SLF:LuaSuspLnkContainer
-- Type: 12

local l_0_0 = mp.getfilesize()
if 20480 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or string.len(l_0_1) < 20 then
  return mp.CLEAN
end
if l_0_2 == nil or string.len(l_0_2) < 15 then
  return mp.CLEAN
end
if string.find(l_0_2, "->", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2:sub(-4)
if l_0_3 == ".lnk" and l_0_2:match("^(%d%d%d%d%d%d%d%d%->.+%.lnk)$", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
