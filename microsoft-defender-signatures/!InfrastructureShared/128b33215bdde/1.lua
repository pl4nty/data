-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\128b33215bdde\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC25: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
      local l_0_1 = (this_sigattrlog[3]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC43: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[5]).matched or (this_sigattrlog[6]).matched then
        local l_0_2, l_0_3, l_0_4, l_0_5, l_0_6 = (this_sigattrlog[5]).utf8p1
      else
      end
      if (this_sigattrlog[7]).matched then
        (bm.add_related_file)((this_sigattrlog[7]).utf8p1)
        local l_0_7 = nil
        local l_0_8 = {}
        l_0_8.friendly = (MpCommon.IsFriendlyProcess)(((bm.get_current_process_startup_info)()).ppid)
        local l_0_9 = nil
        l_0_8.parents = (bm.get_process_relationships)()
        local l_0_10 = getCurrentProcessInjectors()
        l_0_8.injected = R5_PC74
        l_0_8.injectors = ((bm.get_current_process_startup_info)()).ppid
        l_0_8.injection_relationship = l_0_10
        l_0_10 = bm
        l_0_10 = l_0_10.add_related_string
        l_0_10("TelemetryData", R5_PC74, bm.RelatedStringBMReport)
        l_0_10 = mp
        l_0_10 = l_0_10.INFECTED
        return l_0_10
      end
    end
  end
end

