-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9a8_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("SCRIPT:SuspClickfix.A") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 512 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetBruteMatchData)()
local l_0_2 = ""
if l_0_1.is_header then
  l_0_2 = tostring(headerpage)
else
  l_0_2 = tostring(footerpage)
end
l_0_2 = (string.lower)(l_0_2)
l_0_2 = (string.gsub)(l_0_2, "%z", "")
l_0_2 = (string.gsub)(l_0_2, " ", "")
l_0_2 = (string.gsub)(l_0_2, "\'%+\'", "")
l_0_2 = (string.gsub)(l_0_2, "\'", "")
local l_0_3 = false
local l_0_4 = false
local l_0_5 = false
if (string.find)(l_0_2, "http", 1, true) or (string.find)(l_0_2, "ptth", 1, true) then
  l_0_3 = true
end
if (string.find)(l_0_2, "iwr", 1, true) or (string.find)(l_0_2, "irm", 1, true) or (string.find)(l_0_2, "invoke-webrequest", 1, true) or (string.find)(l_0_2, "invoke-restmethod", 1, true) then
  l_0_4 = true
end
if (string.find)(l_0_2, ").invoke()", 1, true) or (string.find)(l_0_2, ";&$", 1, true) or (string.find)(l_0_2, "&([scriptblock", 1, true) or (string.find)(l_0_2, ";&(", 1, true) then
  l_0_5 = true
end
if l_0_3 and l_0_4 and l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN

