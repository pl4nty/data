-- Threat: !InfrastructureShared
-- Name: 3029917f2b19
-- Type: 21

local l_0_0 = mp.getfilesize()
if not (l_0_0 and not (1024000 < l_0_0) and headerpage) or #headerpage > 4096 then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(footerpage))
l_0_1 = mp.GetNormalizedScript(l_0_1)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "=='start':[a-z]+%d%d%d?%=")
if l_0_2 and 30 < #l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
