-- Threat: !InfrastructureShared
-- Name: 2b291fb86b8f
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:PSLummaStealerObfus.C") then
  return mp.CLEAN
end
local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = tostring(headerpage)
else
  l_0_1 = tostring(footerpage)
end
l_0_1 = string.lower(l_0_1)
l_0_1 = string.gsub(l_0_1, "%z", "")
l_0_1 = string.gsub(l_0_1, " ", "")
local l_0_2 = 0
for l_0_3 in string.gmatch(l_0_1, "%[char%]%(%[int%]%(%(%(%d+%)%-bxor%d+%)%)%)") do
  l_0_2 = l_0_2 + 1
end
if 8 <= l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
