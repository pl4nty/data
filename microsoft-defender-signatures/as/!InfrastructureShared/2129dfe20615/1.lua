-- Threat: !InfrastructureShared
-- Name: 2129dfe20615
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = string.lower(tostring(headerpage))
else
  l_0_1 = string.lower(tostring(footerpage))
end
l_0_1 = string.gsub(l_0_1, " ", "")
l_0_1 = string.gsub(l_0_1, "`", "")
if string.find(l_0_1, "globalassemblycache", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
