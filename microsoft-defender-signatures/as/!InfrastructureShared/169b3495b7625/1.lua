-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\169b3495b7625\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched then
  if (this_sigattrlog[5]).utf8p2 == nil or (this_sigattrlog[5]).utf8p2 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

  local l_0_0, l_0_1 = nil
  l_0_1 = string
  l_0_1 = l_0_1.match
  l_0_1 = l_0_1(l_0_0, "[%s%/]%.npl$")
  if not l_0_1 then
    l_0_1 = mp
    l_0_1 = l_0_1.CLEAN
    return l_0_1
  end
end
do
  local l_0_2, l_0_3 = , (bm.get_process_relationships)()
  if l_0_0 ~= nil then
    for l_0_7,l_0_8 in ipairs(R4_PC38) do
      local l_0_4 = nil
      -- DECOMPILER ERROR at PC44: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (bm.trigger_sig)("BmTraverseTreeBlockMac", "Detected", R7_PC44.ppid)
    end
  end
  do
    TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter_ExactMatch")
    return mp.INFECTED
  end
end

