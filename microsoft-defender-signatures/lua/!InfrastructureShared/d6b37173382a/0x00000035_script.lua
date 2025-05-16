-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b37173382a\0x00000035_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC22: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
      local l_0_1, l_0_2, l_0_3, l_0_4 = this_sigattrlog[3], nil
    end
    local l_0_5 = nil
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

    if isnull(l_0_5) or isnull(l_0_5.utf8p1) or isnull(l_0_5.utf8p2) or isnull((bm.get_current_process_startup_info)()) or isnull(((bm.get_current_process_startup_info)()).ppid) then
      return mp.CLEAN
    end
    local l_0_6, l_0_7 = , (string.match)(l_0_5.utf8p2, "^([0-9]+);regionsize:([0-9]+)")
    local l_0_8 = nil
    if isnull(l_0_7) or isnull(l_0_8) or isnull((string.match)(l_0_5.utf8p1, "^([0-9]+:[0-9]+)")) or tonumber(l_0_8) >= 100 then
      return mp.CLEAN
    end
    local l_0_9 = nil
    if isnull((bm.GetProcAddress)(l_0_6.ppid, "amsi.dll", "AmsiScanBuffer")) then
      return mp.CLEAN
    end
    local l_0_10, l_0_11 = , (bm.VirtualQuery)((bm.GetProcAddress)(l_0_6.ppid, "amsi.dll", "AmsiScanBuffer"))
    if not l_0_11 or ((bm.GetProcAddress)(l_0_6.ppid, "amsi.dll", "AmsiScanBuffer")).base_addr ~= tonumber(l_0_7) then
      return mp.CLEAN
    end
    local l_0_12 = nil
    local l_0_13 = nil
    ;
    (bm.add_related_string)("AMSIPatchEDR", safeJsonSerialize({function_name = "AmsiScanBuffer", amsi_address = l_0_10, prot_base_addr = l_0_7, prot_constant = l_0_9, region_size = l_0_8}), bm.RelatedStringBMReport)
    ;
    (bm.set_detection_string)(safeJsonSerialize({function_name = "AmsiScanBuffer", amsi_address = l_0_10, prot_base_addr = l_0_7, prot_constant = l_0_9, region_size = l_0_8}))
    return mp.INFECTED
  end
end

