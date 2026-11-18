-- Threat: \xadAFlafisi.E
-- Type: 13
-- MpAttributes: Lua:HTAExt & RPF:TopLevelFile

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if string.find(l_0_1, "flash%s*player.*%.hta$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
