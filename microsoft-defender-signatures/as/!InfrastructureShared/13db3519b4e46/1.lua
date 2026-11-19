-- Threat: !InfrastructureShared
-- Name: 13db3519b4e46
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") then
  local l_0_0 = bm.get_current_process_startup_info()
  if l_0_0 ~= nil and l_0_0.command_line ~= nil then
    local l_0_1 = string.lower(l_0_0.command_line)
    if l_0_1:match("\\ltsvc.exe") then
      return mp.CLEAN
    end
    if l_0_1:match("\\veeamguesthelper.exe") then
      return mp.CLEAN
    end
    if l_0_1:match("\\avast.+\\regsvr.exe") or l_0_1:match("\\avg.+\\regsvr.exe") then
      return mp.CLEAN
    end
    bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
    TrackPidAndTechniqueBM("BM", "T1561.002", "folderguard_blk_rsm")
  end
end
return mp.INFECTED
