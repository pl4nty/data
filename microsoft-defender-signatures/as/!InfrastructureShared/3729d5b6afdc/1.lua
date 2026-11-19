-- Threat: !InfrastructureShared
-- Name: 3729d5b6afdc
-- Type: 21

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1 = mp.GetBruteMatchData()
local l_0_2 = ""
if l_0_1.is_header then
  l_0_2 = tostring(headerpage)
else
  l_0_2 = tostring(footerpage)
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = string.find
local l_0_4 = string.lower
local l_0_5 = ""
local l_0_6 = 0
for l_0_7, l_0_8 in l_0_2:gmatch("idictionary%.add%(%s*\"(.-)\"%s*,%s*\"(.-)\"%s*%)") do
  l_0_6 = l_0_6 + 1
  l_0_5 = l_0_5 .. l_0_8
end
if l_0_6 < 10 then
  return mp.CLEAN
end
local l_0_9 = l_0_4(l_0_5)
if l_0_9 and (l_0_3(l_0_9, "regread", 1, true) or l_0_3(l_0_9, "scripting.filesystemobject", 1, true) or l_0_3(l_0_9, "getspecialfolder", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
