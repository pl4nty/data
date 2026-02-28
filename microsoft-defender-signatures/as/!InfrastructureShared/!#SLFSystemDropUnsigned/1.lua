local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = peattributes
L0_1 = L0_1.isdamaged
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.no_security
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_PROCESS_ID
    L0_1 = L0_1(L1_1)
    if L0_1 == 4 then
      L1_1 = mp
      L1_1 = L1_1.IsTrustedFile
      L2_1 = false
      L1_1 = L1_1(L2_1)
      if L1_1 == true then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
      L1_1 = mp
      L1_1 = L1_1.get_contextdata
      L2_1 = mp
      L2_1 = L2_1.CONTEXT_DATA_FILEPATH
      L1_1 = L1_1(L2_1)
      if L1_1 ~= nil then
        L2_1 = MpCommon
        L2_1 = L2_1.PathToWin32Path
        L3_1 = L1_1
        L2_1 = L2_1(L3_1)
        if L2_1 == nil then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
        L3_1 = {}
        L3_1[":\\windows\\softwaredistribution"] = 1
        L3_1[":\\windows\\assembly\\nativeimage"] = 1
        L3_1[":\\program files\\cisco\\amp\\tmp\\"] = 1
        L3_1[":\\windows\\carbonblack\\store\\tm"] = 1
        L3_1[":\\program files (x86)\\trend mi"] = 1
        L3_1[":\\program files\\trend\\sprotect"] = 1
        L3_1[":\\$windows.~bt\\newos\\windows\\w"] = 1
        L3_1[":\\windows\\winsxs\\temp\\inflight"] = 1
        L3_1[":\\build_drop\\3ebuilddrop\\build"] = 1
        L3_1[":\\windows\\csc\\v2.0.6\\namespace"] = 1
        L3_1[":\\program files (x86)\\bmw\\ispi"] = 1
        L3_1[":\\program files\\sourcefire\\fir"] = 1
        L3_1[":\\programdata\\origin\\selfupdat"] = 1
        L3_1[":\\program files\\microsoft dyna"] = 1
        L3_1[":\\program files\\matlab\\r2019a\\"] = 1
        L4_1 = #L2_1
        if 30 < L4_1 then
          L4_1 = string
          L4_1 = L4_1.sub
          L5_1 = L2_1
          L6_1 = 2
          L7_1 = 31
          L4_1 = L4_1(L5_1, L6_1, L7_1)
          L5_1 = L4_1
          L4_1 = L4_1.lower
          L4_1 = L4_1(L5_1)
          L5_1 = L3_1[L4_1]
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L4_1
            L7_1 = "\\$windows.~bt\\"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              goto lbl_105
            end
          end
          L5_1 = mp
          L5_1 = L5_1.CLEAN
          return L5_1
        end
        ::lbl_105::
        L4_1 = MpCommon
        L4_1 = L4_1.QueryPersistContext
        L5_1 = L1_1
        L6_1 = "SystemDrop"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          L4_1 = MpCommon
          L4_1 = L4_1.AppendPersistContext
          L5_1 = L1_1
          L6_1 = "SystemDrop"
          L7_1 = 600
          L4_1(L5_1, L6_1, L7_1)
        end
      end
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
