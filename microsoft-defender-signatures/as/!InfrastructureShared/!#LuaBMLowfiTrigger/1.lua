local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.getfilesize
    L0_1 = L0_1()
    if 8388608 <= L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.FILEPATH_QUERY_LOWERCASE
    L1_1 = L1_1(L2_1)
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = 0
    L5_1 = 4
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 == "\\\\?\\" then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L1_1
      L4_1 = 5
      L2_1 = L2_1(L3_1, L4_1)
      L1_1 = L2_1
    end
    L3_1 = L1_1
    L2_1 = L1_1.sub
    L4_1 = 1
    L5_1 = 8
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 == "\\device\\" then
      L2_1 = MpCommon
      L2_1 = L2_1.PathToWin32Path
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
      if L1_1 == nil then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
    end
    L2_1 = {}
    L3_1 = mp
    L3_1 = L3_1.enum_mpattributesubstring
    L4_1 = "SLF:"
    L3_1 = L3_1(L4_1)
    L4_1 = #L3_1
    if L4_1 ~= 0 and L3_1 ~= nil then
      L4_1 = ipairs
      L5_1 = L3_1
      L4_1, L5_1, L6_1 = L4_1(L5_1)
      for L7_1, L8_1 in L4_1, L5_1, L6_1 do
        L9_1 = table
        L9_1 = L9_1.insert
        L10_1 = L2_1
        L11_1 = L8_1
        L9_1(L10_1, L11_1)
      end
    end
    L4_1 = mp
    L4_1 = L4_1.enum_mpattributesubstring
    L5_1 = "ALF:"
    L4_1 = L4_1(L5_1)
    L5_1 = #L4_1
    if L5_1 ~= 0 and L4_1 ~= nil then
      L5_1 = ipairs
      L6_1 = L4_1
      L5_1, L6_1, L7_1 = L5_1(L6_1)
      for L8_1, L9_1 in L5_1, L6_1, L7_1 do
        L10_1 = table
        L10_1 = L10_1.insert
        L11_1 = L2_1
        L12_1 = L9_1
        L10_1(L11_1, L12_1)
      end
    end
    L5_1 = mp
    L5_1 = L5_1.enum_mpattributesubstring
    L6_1 = "TEL:"
    L5_1 = L5_1(L6_1)
    L6_1 = #L5_1
    if L6_1 ~= 0 and L5_1 ~= nil then
      L6_1 = ipairs
      L7_1 = L5_1
      L6_1, L7_1, L8_1 = L6_1(L7_1)
      for L9_1, L10_1 in L6_1, L7_1, L8_1 do
        L11_1 = table
        L11_1 = L11_1.insert
        L12_1 = L2_1
        L13_1 = L10_1
        L11_1(L12_1, L13_1)
      end
    end
    L6_1 = #L2_1
    if L6_1 ~= 0 and L2_1 ~= nil then
      L6_1 = ipairs
      L7_1 = L2_1
      L6_1, L7_1, L8_1 = L6_1(L7_1)
      for L9_1, L10_1 in L6_1, L7_1, L8_1 do
        L11_1 = string
        L11_1 = L11_1.find
        L12_1 = L10_1
        L13_1 = "!rfn"
        L14_1 = 1
        L15_1 = true
        L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
        if not L11_1 then
          L11_1 = string
          L11_1 = L11_1.find
          L12_1 = L10_1
          L13_1 = "HeraklezEval"
          L14_1 = 1
          L15_1 = true
          L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
          if not L11_1 then
            L11_1 = string
            L11_1 = L11_1.find
            L12_1 = L10_1
            L13_1 = "ASRCALL"
            L14_1 = 1
            L15_1 = true
            L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
            if not L11_1 then
              L11_1 = MpCommon
              L11_1 = L11_1.QueryPersistContext
              L12_1 = L1_1
              L13_1 = L10_1
              L11_1 = L11_1(L12_1, L13_1)
              if not L11_1 then
                L12_1 = MpCommon
                L12_1 = L12_1.AppendPersistContext
                L13_1 = L1_1
                L14_1 = L10_1
                L15_1 = 180
                L12_1(L13_1, L14_1, L15_1)
              end
            end
          end
        end
      end
    end
    L6_1 = MpCommon
    L6_1 = L6_1.QueryPersistContext
    L7_1 = L1_1
    L8_1 = "BMLowfiTrigger"
    L6_1 = L6_1(L7_1, L8_1)
    if not L6_1 then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "MpDisableCaching"
      L7_1(L8_1)
      L7_1 = MpCommon
      L7_1 = L7_1.AppendPersistContext
      L8_1 = L1_1
      L9_1 = "BMLowfiTrigger"
      L10_1 = 180
      L7_1(L8_1, L9_1, L10_1)
    end
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
