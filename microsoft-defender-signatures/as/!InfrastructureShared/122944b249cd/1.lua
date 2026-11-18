-- Threat: !InfrastructureShared
-- Name: 122944b249cd
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 500 < l_0_0 then
  return mp.CLEAN
end
if headerpage == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetBruteMatchData()
if l_0_1 == nil or l_0_1.match_offset == nil then
  return mp.CLEAN
end
if l_0_1.match_offset >= l_0_0 - 12 and headerpage[l_0_0] == 0 then
  return mp.INFECTED
end
return mp.CLEAN
