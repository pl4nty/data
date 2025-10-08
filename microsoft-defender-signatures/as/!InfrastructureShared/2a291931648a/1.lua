-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2a291931648a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = "/package.json"
if (string.find)(l_0_0, l_0_1, -1 * #l_0_1, true) then
  return mp.INFECTED
end
return mp.CLEAN

