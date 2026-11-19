-- Threat: !InfrastructureShared
-- Name: 35298738b612
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:PSLummaStealerObfus.B") then
  return mp.CLEAN
end
local l_0_0 = ""
l_0_0 = tostring(footerpage)
l_0_0 = string.lower(l_0_0)
l_0_0 = string.gsub(l_0_0, "%z", "")
l_0_0 = string.gsub(l_0_0, " ", "")
local l_0_1 = 0
for l_0_2 in string.gmatch(l_0_0, "%-as%[type%]%)::%$") do
  l_0_1 = l_0_1 + 1
end
local l_0_3 = 0
for l_0_4 in string.gmatch(l_0_0, "%d%d+,") do
  l_0_3 = l_0_3 + 1
end
if 3 <= l_0_1 and 512 <= l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
