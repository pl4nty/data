local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L2_1 = false
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
L5_1 = ipairs
L6_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = L9_1.image_path
  if L10_1 ~= nil then
    L10_1 = string
    L10_1 = L10_1.lower
    L11_1 = MpCommon
    L11_1 = L11_1.PathToWin32Path
    L12_1 = L9_1.image_path
    L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L11_1(L12_1)
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
    L11_1 = mp
    L11_1 = L11_1.bitand
    L12_1 = L9_1.reason_ex
    L13_1 = 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 == 1 then
      L2_1 = true
    end
    if L11_1 == 1 then
      L12_1 = mp
      L12_1 = L12_1.IsKnownFriendlyFile
      L13_1 = L10_1
      L14_1 = true
      L15_1 = false
      L12_1 = L12_1(L13_1, L14_1, L15_1)
      if L12_1 then
        goto lbl_82
      end
    end
    if L11_1 == 1 then
      L12_1 = string
      L12_1 = L12_1.find
      L13_1 = L10_1
      L14_1 = ":\\windows\\"
      L15_1 = 1
      L16_1 = true
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      if not L12_1 then
        L12_1 = string
        L12_1 = L12_1.find
        L13_1 = L10_1
        L14_1 = ":\\$windows.~bt\\"
        L15_1 = 1
        L16_1 = true
        L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
        if not L12_1 then
          L12_1 = string
          L12_1 = L12_1.find
          L13_1 = L10_1
          L14_1 = ":\\program files (x86)\\"
          L15_1 = 1
          L16_1 = true
          L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
          if not L12_1 then
            L12_1 = string
            L12_1 = L12_1.find
            L13_1 = L10_1
            L14_1 = ":\\program files\\"
            L15_1 = 1
            L16_1 = true
            L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
            if not L12_1 then
              goto lbl_85
            end
          end
        end
      end
      ::lbl_82::
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
  end
  ::lbl_85::
end
if L2_1 == false then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L1_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.GetExecutablesFromCommandLine
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  L6_1 = ipairs
  L7_1 = L5_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = mp
    L11_1 = L11_1.ContextualExpandEnvironmentVariables
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    L10_1 = L11_1
    L11_1 = sysio
    L11_1 = L11_1.IsFileExists
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L11_1 = bm
      L11_1 = L11_1.add_related_file
      L12_1 = L10_1
      L11_1(L12_1)
    end
  end
end
L5_1 = reportSessionInformation
L5_1()
L5_1 = add_parents
L5_1()
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
