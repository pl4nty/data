-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\80cc_284.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 and (string.find)((string.lower)(l_0_0.image_path), "sbsimulation_sb_", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

