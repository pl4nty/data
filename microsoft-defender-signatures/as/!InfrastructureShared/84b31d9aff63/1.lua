-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b31d9aff63\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
if l_0_1 ~= nil then
  for l_0_5,l_0_6 in ipairs(l_0_1) do
    (bm.trigger_sig)("BmTraverseTreeBlockMac", "Detected", l_0_6.ppid)
  end
end
do
  do
    if (this_sigattrlog[3]).matched then
      local l_0_7 = (bm.get_imagepath)()
      if IsExcludedByImagePathMacOS(l_0_7) then
        return mp.CLEAN
      end
      if (SuspMacPathsToMonitor(l_0_7, true) or (string.find)(l_0_7, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_7, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_7, "/Users/[^/]+/Desktop/", 1, false)) and (sysio.IsFileExists)(l_0_7) then
        (bm.add_threat_file)(l_0_7)
      end
    end
    TrackPidAndTechniqueBM("BM", "T1204", "Execution_UserExecution_ExactMatch")
    return mp.INFECTED
  end
end

