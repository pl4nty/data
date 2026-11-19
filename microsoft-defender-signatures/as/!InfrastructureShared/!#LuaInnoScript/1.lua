-- Threat: !InfrastructureShared
-- Name: !#Lua:InnoScript
-- Type: 12
-- MpAttributes: !RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 800000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1
l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FNAME))
if l_0_1 ~= nil and string.sub(l_0_1, -17) == "->(innosetupdata)" then
  mp.readprotection(false)
  local l_0_2 = mp.readu_u32(mp.readfile(0, 4), 1)
  if l_0_2 < 256 then
    return mp.INFECTED
  end
end
return mp.CLEAN
