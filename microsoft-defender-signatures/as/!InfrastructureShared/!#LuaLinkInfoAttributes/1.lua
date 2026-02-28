local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -25
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == "\\microsoft\\windows\\recent" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetLnkInfo
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L3_2 = A0_2
  L2_2 = A0_2.gsub
  L4_2 = "\\+$"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  A0_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.gmatch
  L3_2 = A0_2
  L4_2 = "[^\\]+"
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  for L5_2 in L2_2, L3_2, L4_2 do
    L6_2 = table
    L6_2 = L6_2.insert
    L7_2 = L1_2
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
  L2_2 = {}
  L3_2 = #L1_2
  L4_2 = L1_2[L3_2]
  if L4_2 then
    L4_2 = L1_2[L3_2]
    L5_2 = L4_2
    L4_2 = L4_2.find
    L6_2 = "%."
    L4_2 = L4_2(L5_2, L6_2)
  end
  if L4_2 then
    L5_2 = L1_2[L3_2]
    L2_2.filename = L5_2
    L3_2 = L3_2 - 1
  end
  L5_2 = L1_2[1]
  if L5_2 then
    L5_2 = L1_2[1]
    L6_2 = L5_2
    L5_2 = L5_2.match
    L7_2 = "^[A-Za-z]:$"
    L5_2 = L5_2(L6_2, L7_2)
  end
  if L5_2 then
    L6_2 = L3_2 - 1
    if L6_2 then
      goto lbl_47
    end
  end
  L6_2 = L3_2
  ::lbl_47::
  L2_2.folder_count = L6_2
  L6_2 = L3_2 or L6_2
  if not (L3_2 < 5) or not L3_2 then
    L6_2 = 5
  end
  L7_2 = 0
  L8_2 = L6_2 - 1
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = "last_folder"
    L12_2 = L10_2
    L11_2 = L11_2 .. L12_2
    L12_2 = L3_2 - L10_2
    L12_2 = L1_2[L12_2]
    L2_2[L11_2] = L12_2
  end
  return L2_2
end

L3_1 = L1_1.BasePath
if L3_1 ~= nil then
  L4_1 = #L3_1
  if 1 < L4_1 then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    L5_1 = L3_1
    L4_1 = L3_1.gsub
    L6_1 = "%s"
    L7_1 = "/x20"
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    L3_1 = L4_1
    L5_1 = L3_1
    L4_1 = L3_1.gsub
    L6_1 = "%("
    L7_1 = "/x28"
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    L3_1 = L4_1
    L5_1 = L3_1
    L4_1 = L3_1.gsub
    L6_1 = "%)"
    L7_1 = "/x29"
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    L3_1 = L4_1
    L4_1 = L2_1
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 ~= nil then
      L5_1 = L4_1.filename
      if L5_1 ~= nil then
        L5_1 = L4_1.filename
        L6_1 = #L5_1
        if 40 < L6_1 then
          L6_1 = string
          L6_1 = L6_1.sub
          L7_1 = L5_1
          L8_1 = 1
          L9_1 = 40
          L6_1 = L6_1(L7_1, L8_1, L9_1)
          L5_1 = L6_1
        end
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = string
        L7_1 = L7_1.format
        L8_1 = "Lua:LnkTargetFname!%s"
        L9_1 = L5_1
        L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L7_1(L8_1, L9_1)
        L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
        L7_1 = L5_1
        L6_1 = L5_1.match
        L8_1 = "%.(.+)$"
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 then
          L7_1 = mp
          L7_1 = L7_1.set_mpattribute
          L8_1 = string
          L8_1 = L8_1.format
          L9_1 = "Lua:LnkTargetFnameExt!%s"
          L10_1 = L6_1
          L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L8_1(L9_1, L10_1)
          L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
        end
      end
      L5_1 = L4_1.folder_count
      if L5_1 ~= nil then
        L5_1 = L4_1.folder_count
        if 1 <= L5_1 then
          L5_1 = L4_1.folder_count
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = string
          L7_1 = L7_1.format
          L8_1 = "Lua:LnkTargetLastFolderCount!%s"
          L9_1 = tostring
          L10_1 = L5_1
          L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L9_1(L10_1)
          L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
          L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
          L6_1 = 0
          L7_1 = 4
          L8_1 = 1
          for L9_1 = L6_1, L7_1, L8_1 do
            L10_1 = "last_folder"
            L11_1 = L9_1
            L10_1 = L10_1 .. L11_1
            L10_1 = L4_1[L10_1]
            if L10_1 then
              L11_1 = mp
              L11_1 = L11_1.set_mpattribute
              L12_1 = string
              L12_1 = L12_1.format
              L13_1 = "Lua:LnkTargetLastFolder%s!%s"
              L14_1 = tostring
              L15_1 = L9_1
              L14_1 = L14_1(L15_1)
              L15_1 = tostring
              L16_1 = L10_1
              L15_1, L16_1 = L15_1(L16_1)
              L12_1, L13_1, L14_1, L15_1, L16_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
              L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
