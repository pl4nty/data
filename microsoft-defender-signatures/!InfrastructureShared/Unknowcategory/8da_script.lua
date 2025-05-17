-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8da_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("SCRIPT:PSLummaStealerObfus.C") then
  return mp.CLEAN
end
local l_0_0 = (mp.GetBruteMatchData)()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = tostring(headerpage)
else
  l_0_1 = tostring(footerpage)
end
l_0_1 = (string.lower)(l_0_1)
l_0_1 = (string.gsub)(l_0_1, "%z", "")
l_0_1 = (string.gsub)(l_0_1, " ", "")
local l_0_2 = 0
for l_0_6 in (string.gmatch)(l_0_1, "%[char%]%(%[int%]%(%(%(%d+%)%-bxor%d+%)%)%)") do
  l_0_2 = l_0_2 + 1
end
if l_0_2 >= 8 then
  return mp.INFECTED
end
return mp.CLEAN

