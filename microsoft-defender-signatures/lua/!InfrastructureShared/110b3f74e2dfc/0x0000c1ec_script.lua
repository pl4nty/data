-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\110b3f74e2dfc\0x0000c1ec_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p2 ~= nil then
      local l_0_1, l_0_2 = (this_sigattrlog[2]).utf8p2
    end
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 ~= nil then
      local l_0_3 = nil
      bm_AddRelatedFileFromCommandLine(l_0_3, "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|")
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
        (mp.ReportLowfi)((this_sigattrlog[4]).utf8p1, 2288844567)
      end
      if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
        local l_0_4 = nil
        local l_0_5 = (this_sigattrlog[5]).utf8p2
        bm_AddRelatedFileFromCommandLine(l_0_5, "|.lnk|")
      end
      do
        do
          ;
          (bm.trigger_sig_self_propagate)("SuspChildProcessLaunch", "Behavior:Win32/StarStickle.A!dha")
          do return mp.INFECTED end
          return mp.CLEAN
        end
      end
    end
  end
end

