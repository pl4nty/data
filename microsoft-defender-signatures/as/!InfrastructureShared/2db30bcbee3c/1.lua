-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db30bcbee3c\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  else
  end
  if (this_sigattrlog[2]).matched then
    do return mp.CLEAN end
    if (this_sigattrlog[2]).utf8p1 == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_4 = nil
    if (mp.IsKnownFriendlyFile)((this_sigattrlog[2]).utf8p1, true, false) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (bm.add_related_file)((this_sigattrlog[2]).utf8p1)
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

    TrackFileAndTechnique((this_sigattrlog[2]).utf8p1, "T1574.001:printnotify_dll_hijack")
    TrackPidAndTechniqueBM("BM", "T1543.003", "printnotify_svc_hijack")
    return mp.INFECTED
  end
end

