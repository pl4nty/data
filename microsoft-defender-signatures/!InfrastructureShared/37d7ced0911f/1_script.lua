-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\37d7ced0911f\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0.image_path, "/SafeBreach/app/sbsimulation/sbsimulation_sb_", 1, true) then
  return mp.INFECTED
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_1.image_path, "/SafeBreach/app/sbsimulation/sbsimulation_sb_", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

