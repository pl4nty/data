-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanJSStegoDropperB!MTB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
l_0_0 = tostring(headerpage)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = 0
for l_0_5 in l_0_0:gmatch("[\194-ô][\128-¿]+") do
  l_0_1 = l_0_1 + 1
end
if l_0_1 > 2 then
  return mp.INFECTED
end
return mp.CLEAN

