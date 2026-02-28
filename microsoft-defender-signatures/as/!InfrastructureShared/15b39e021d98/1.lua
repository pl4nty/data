local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 1) then
    goto lbl_15
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\program files"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\mpsigstub.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\mpcmdrun.exe"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_45
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_45::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\lsass.exe"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.get_process_relationships
  L1_1, L2_1 = L1_1()
  if L1_1 then
    L3_1 = ipairs
    L4_1 = L1_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = L7_1.image_path
      if L8_1 ~= nil then
        L8_1 = mp
        L8_1 = L8_1.bitand
        L9_1 = L7_1.reason_ex
        L10_1 = 2
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 == 2 then
          L8_1 = string
          L8_1 = L8_1.lower
          L9_1 = L7_1.image_path
          L8_1 = L8_1(L9_1)
          L9_1 = string
          L9_1 = L9_1.find
          L10_1 = L8_1
          L11_1 = "\\dell secureworks\\red cloak\\[^\\]+\\entwine.exe"
          L9_1 = L9_1(L10_1, L11_1)
          if not L9_1 then
            L9_1 = string
            L9_1 = L9_1.find
            L10_1 = L8_1
            L11_1 = "\\program files\\morphisec\\bin\\protectorservice64.exe"
            L12_1 = 1
            L13_1 = true
            L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
            if not L9_1 then
              L9_1 = string
              L9_1 = L9_1.find
              L10_1 = L8_1
              L11_1 = "\\sentinelone\\sentinel agent[^\\]+\\sentinelagent.exe"
              L9_1 = L9_1(L10_1, L11_1)
              if not L9_1 then
                goto lbl_103
              end
            end
          end
          L9_1 = mp
          L9_1 = L9_1.CLEAN
          return L9_1
        end
      end
      ::lbl_103::
    end
  end
end
L1_1 = TrackCustomPersistContextNameByPPID
L2_1 = "query"
L3_1 = "bm"
L4_1 = "MimikatzTrigger"
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
