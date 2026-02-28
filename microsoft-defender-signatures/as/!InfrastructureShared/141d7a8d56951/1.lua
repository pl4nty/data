local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = L0_1.image_path
  L2_1 = mp
  L2_1 = L2_1.GetProcessCommandLine
  L3_1 = L0_1.ppid
  L2_1 = L2_1(L3_1)
  L3_1 = isnull
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L1_1
      L3_1 = L3_1(L4_1)
      L1_1 = L3_1
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "\\system32\\dllhost.exe"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "{3e5fc7f9-9a51-4367-9063-a120244fbec7}"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 then
          L3_1 = MpCommon
          L3_1 = L3_1.GetPersistContextCountNoPath
          L4_1 = "bm_uacbypass_connmgr"
          L3_1 = L3_1(L4_1)
          if 0 < L3_1 then
            L3_1 = MpCommon
            L3_1 = L3_1.GetPersistContextNoPath
            L4_1 = "bm_uacbypass_connmgr"
            L3_1 = L3_1(L4_1)
            if L3_1 then
              L4_1 = false
              L5_1 = ipairs
              L6_1 = L3_1
              L5_1, L6_1, L7_1 = L5_1(L6_1)
              for L8_1, L9_1 in L5_1, L6_1, L7_1 do
                L10_1 = string
                L10_1 = L10_1.gsub
                L11_1 = L9_1
                L12_1 = ","
                L13_1 = "_"
                L10_1 = L10_1(L11_1, L12_1, L13_1)
                L9_1 = L10_1
                L10_1 = set_research_data
                L11_1 = "PossibleTrigger"
                L12_1 = L9_1
                L13_1 = false
                L10_1(L11_1, L12_1, L13_1)
                L4_1 = true
              end
              if L4_1 == true then
                L5_1 = versioning
                L5_1 = L5_1.IsSeville
                L5_1 = L5_1()
                if L5_1 then
                  L5_1 = mp
                  L5_1 = L5_1.INFECTED
                  return L5_1
                end
                L5_1 = mp
                L5_1 = L5_1.LOWFI
                return L5_1
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
