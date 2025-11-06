-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3b29624fda86\1.luac 

-- params : ...
-- function num : 0
(mp.set_mpattribute)("SCPT:Linux/SuspServiceCreation")
local l_0_0 = (mp.getfilename)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = ".service"
if (string.find)(l_0_0, l_0_1, -1 * l_0_1, true) then
  return mp.INFECTED
end
return mp.CLEAN

