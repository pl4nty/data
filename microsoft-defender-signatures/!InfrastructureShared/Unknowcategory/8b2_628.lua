-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8b2_628.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("SCRIPT:PSLummaStealerObfus.B") then
  return mp.CLEAN
end
local l_0_0 = ""
l_0_0 = tostring(footerpage)
l_0_0 = (string.lower)(l_0_0)
l_0_0 = (string.gsub)(l_0_0, "%z", "")
l_0_0 = (string.gsub)(l_0_0, " ", "")
local l_0_1 = 0
for l_0_5 in (string.gmatch)(l_0_0, "%-as%[type%]%)::%$") do
  l_0_1 = l_0_1 + 1
end
local l_0_6 = 0
for l_0_10 in (string.gmatch)(l_0_0, "%d%d+,") do
  l_0_6 = l_0_6 + 1
end
if l_0_1 >= 3 and l_0_6 >= 512 then
  return mp.INFECTED
end
return mp.CLEAN

