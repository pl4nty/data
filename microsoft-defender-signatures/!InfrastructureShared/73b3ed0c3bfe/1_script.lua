-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3ed0c3bfe\1_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
    local l_0_0 = (bm.get_imagepath)()
    if IsExcludedByImagePathMacOS(l_0_0) then
      return mp.CLEAN
    end
  end
  TrackPidAndTechniqueBM("BM", "T1204", "Execution_UserExecution_ExactMatch")
  return mp.INFECTED
end

