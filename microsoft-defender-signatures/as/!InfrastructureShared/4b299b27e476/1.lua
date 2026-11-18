-- Threat: !InfrastructureShared
-- Name: 4b299b27e476
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = string.lower(tostring(headerpage))
else
  l_0_1 = string.lower(tostring(footerpage))
end
local l_0_2, l_0_3 = l_0_1:gsub("&chr%(.-%)&chr%(.-%)&chr%(.-%)&chr%(.-%)&chr%(", "")
if 20 < l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
