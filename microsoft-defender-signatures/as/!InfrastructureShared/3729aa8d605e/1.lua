-- Threat: !InfrastructureShared
-- Name: 3729aa8d605e
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset + 1
local l_0_2 = 256
local l_0_3 = ""
if l_0_0.is_header then
  l_0_3 = string.lower(tostring(headerpage):sub(l_0_1, l_0_1 + l_0_2))
else
  l_0_3 = string.lower(tostring(footerpage):sub(l_0_1, l_0_1 + l_0_2))
end
local l_0_4 = l_0_3:match("<requires_approval>(.-)</requires_approval>")
if not l_0_4 then
  return mp.CLEAN
end
if l_0_4 and (l_0_4 == "true" or l_0_4 == "false") then
  return mp.CLEAN
end
return mp.INFECTED
