local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.ENGINEBUILD
if L0_1 < 19850 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESS_ID
L0_1 = L0_1(L1_1)
if L0_1 == 4 then
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_REMOTE_SESSION_IP
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if L1_1 and L2_1 and L2_1 ~= "" then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:RemoteContextPresent"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:RemoteIP!"
    L5_1 = L2_1
    L4_1 = L4_1 .. L5_1
    L3_1(L4_1)
    L3_1 = pcall
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME
    L3_1, L4_1 = L3_1(L4_1, L5_1)
    if L3_1 and L4_1 and L4_1 ~= "" then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:RemoteDom!"
      L7_1 = L4_1
      L6_1 = L6_1 .. L7_1
      L5_1(L6_1)
    end
    L5_1 = pcall
    L6_1 = mp
    L6_1 = L6_1.get_contextdata
    L7_1 = mp
    L7_1 = L7_1.CONTEXT_DATA_REMOTE_SESSION_USERNAME
    L5_1, L6_1 = L5_1(L6_1, L7_1)
    if L5_1 and L6_1 and L6_1 ~= "" then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "Lua:RemoteUsr!"
      L9_1 = L6_1
      L8_1 = L8_1 .. L9_1
      L7_1(L8_1)
    end
    L7_1 = mp
    L7_1 = L7_1.getfilename
    L8_1 = mp
    L8_1 = L8_1.FILEPATH_QUERY_LOWERCASE
    L7_1 = L7_1(L8_1)
    if not L7_1 or L7_1 == "" then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
    L9_1 = L7_1
    L8_1 = L7_1.sub
    L10_1 = 1
    L11_1 = 8
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    if L8_1 == "\\device\\" then
      L8_1 = MpCommon
      L8_1 = L8_1.PathToWin32Path
      L9_1 = L7_1
      L8_1 = L8_1(L9_1)
      L7_1 = L8_1
      if L7_1 then
        L9_1 = L7_1
        L8_1 = L7_1.lower
        L8_1 = L8_1(L9_1)
        L7_1 = L8_1
      else
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
      end
    end
    L8_1 = mp
    L8_1 = L8_1.IsHipsRuleEnabled
    L9_1 = "d1e49aac-8f56-4280-b9ba-993a6d77406c"
    L8_1, L9_1 = L8_1(L9_1)
    if L8_1 then
      if L9_1 == 1 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:RemoteHipsRuleEnabledBlock"
        L10_1(L11_1)
        L10_1 = AppendToRollingQueue
        L11_1 = "file_remote_dropped"
        L12_1 = L7_1
        L13_1 = 1
        L14_1 = 5
        L10_1(L11_1, L12_1, L13_1, L14_1)
      elseif L9_1 == 2 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:RemoteHipsRuleEnabledAudit"
        L10_1(L11_1)
      end
      L10_1 = mp
      L10_1 = L10_1.set_mpattribute
      L11_1 = "Lua:RemoteHipsRuleEnabled"
      L10_1(L11_1)
    end
    L10_1 = mp
    L10_1 = L10_1.get_mpattribute
    L11_1 = "BM_MZ_FILE"
    L10_1 = L10_1(L11_1)
    if L10_1 then
      L10_1 = AppendToRollingQueue
      L11_1 = "SuspExeFileDroppedViaSMB"
      L12_1 = L7_1
      L13_1 = nil
      L14_1 = 5000
      L10_1(L11_1, L12_1, L13_1, L14_1)
    else
      L10_1 = AppendToRollingQueue
      L11_1 = "SuspFileDroppedViaSMB"
      L12_1 = L7_1
      L13_1 = nil
      L14_1 = 5000
      L10_1(L11_1, L12_1, L13_1, L14_1)
    end
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
