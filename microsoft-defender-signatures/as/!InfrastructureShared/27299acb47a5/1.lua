-- Threat: !InfrastructureShared
-- Name: 27299acb47a5
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:PSLummaStealerObfus.A") then
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
if not string.find(l_0_1, "}).name", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_1, "http", 1, true) and not string.find(l_0_1, "c:\\programdata\\", 1, true) then
  return mp.CLEAN
end
local l_0_2 = 0
for l_0_3 in string.gmatch(l_0_1, "%-variable%s+") do
  l_0_2 = l_0_2 + 1
end
for l_0_4 in string.gmatch(l_0_1, "%s+variable:") do
  l_0_2 = l_0_2 + 1
end
for l_0_5 in string.gmatch(l_0_1, "'[A-Za-z*%-]*%*[A-Za-z*%-]*'") do
  l_0_2 = l_0_2 + 1
end
if 5 <= l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
