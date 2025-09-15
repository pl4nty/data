-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELPowerShellPowExcA!MTB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
l_0_0 = tostring(headerpage)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
l_0_0 = (string.gsub)(l_0_0, " ", "")
l_0_0 = (string.gsub)(l_0_0, "\'%+\'", "")
l_0_0 = (string.gsub)(l_0_0, "\'", "")
local l_0_1 = false
local l_0_2 = false
if (string.find)(l_0_0, "add-mppreference", 1, true) or (string.find)(l_0_0, "set-mppreference", 1, true) or (string.find)(l_0_0, "get-mppreference", 1, true) then
  l_0_1 = true
end
if (string.find)(l_0_0, "exclusion", 1, true) then
  l_0_2 = true
end
if l_0_1 and l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN

