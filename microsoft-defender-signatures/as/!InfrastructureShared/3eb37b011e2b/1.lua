local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 1) then
    goto lbl_15
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\program files"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\mpsigstub.exe"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\mpcmdrun.exe"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 == nil then
      goto lbl_49
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_49::
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L1_1
L4_1 = -16
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == "\\threatsonar.exe" then
  L2_1 = mp
  L2_1 = L2_1.IsKnownFriendlyFile
  L3_1 = L1_1
  L4_1 = true
  L5_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 ~= nil and L2_1 == true then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "\\lsass.exe"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = bm
  L2_1 = L2_1.get_process_relationships
  L2_1, L3_1 = L2_1()
  if L2_1 then
    L4_1 = ipairs
    L5_1 = L2_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = L8_1.image_path
      if L9_1 ~= nil then
        L9_1 = mp
        L9_1 = L9_1.bitand
        L10_1 = L8_1.reason_ex
        L11_1 = 2
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 == 2 then
          L9_1 = string
          L9_1 = L9_1.lower
          L10_1 = L8_1.image_path
          L9_1 = L9_1(L10_1)
          L10_1 = string
          L10_1 = L10_1.find
          L11_1 = L9_1
          L12_1 = "\\dell secureworks\\red cloak\\[^\\]+\\entwine.exe"
          L10_1 = L10_1(L11_1, L12_1)
          if not L10_1 then
            L10_1 = string
            L10_1 = L10_1.find
            L11_1 = L9_1
            L12_1 = "\\program files\\morphisec\\bin\\protectorservice64.exe"
            L13_1 = 1
            L14_1 = true
            L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
            if not L10_1 then
              L10_1 = string
              L10_1 = L10_1.find
              L11_1 = L9_1
              L12_1 = "\\sentinelone\\sentinel agent[^\\]+\\sentinelagent.exe"
              L10_1 = L10_1(L11_1, L12_1)
              if not L10_1 then
                goto lbl_127
              end
            end
          end
          L10_1 = mp
          L10_1 = L10_1.CLEAN
          return L10_1
        end
      end
      ::lbl_127::
    end
  end
end
L2_1 = TrackCustomPersistContextNameByPPID
L3_1 = "query"
L4_1 = "bm"
L5_1 = "MimikatzTrigger"
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == true then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
