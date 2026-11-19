-- Threat: !InfrastructureShared
-- Name: 41292534ce99
-- Type: 21

local l_0_0 = mp.getfilesize()
if 255 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
if l_0_1:find("%.eml%->%(part000%d:%)$") or l_0_1:find("%->%(ole stream %d%)%->%(msg%)%->%(rtfbody%)") then
  return mp.INFECTED
end
return mp.CLEAN
