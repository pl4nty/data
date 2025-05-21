-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\95c_927.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("SCRIPT:PSLummaStealerObfus.A") then
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
if not (string.find)(l_0_1, "}).name", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_1, "http", 1, true) and not (string.find)(l_0_1, "c:\\programdata\\", 1, true) then
  return mp.CLEAN
end
local l_0_2 = 0
for l_0_6 in (string.gmatch)(l_0_1, "%-variable%s+") do
  l_0_2 = l_0_2 + 1
end
for l_0_10 in (string.gmatch)(l_0_1, "%s+variable:") do
  l_0_2 = l_0_2 + 1
end
for l_0_14 in (string.gmatch)(l_0_1, "\'[A-Za-z*%-]*%*[A-Za-z*%-]*\'") do
  l_0_2 = l_0_2 + 1
end
if l_0_2 >= 5 then
  return mp.INFECTED
end
return mp.CLEAN

