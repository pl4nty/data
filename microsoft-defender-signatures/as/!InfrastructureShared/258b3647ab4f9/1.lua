-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\258b3647ab4f9\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
for l_0_5,l_0_6 in ipairs(l_0_1) do
  if l_0_6.image_path and (string.find)((string.lower)(l_0_6.image_path), "/bun", -4, true) then
    TrackPidAndTechniqueBM(l_0_6.ppid, "T1195.001", "SuspBunProcess", 1800)
  end
end
return mp.INFECTED

