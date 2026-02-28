local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_PATH
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
L3_1 = L0_1
L2_1 = L0_1.find
L4_1 = "downloads"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil then
  L3_1 = L0_1
  L2_1 = L0_1.find
  L4_1 = "desktop"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    goto lbl_96
  end
end
L3_1 = L1_1
L2_1 = L1_1.len
L2_1 = L2_1(L3_1)
if L2_1 == 9 then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L1_1
  L4_1 = -9
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= "setup.zip" then
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = -9
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= "setup.iso" then
      goto lbl_51
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_51::
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L1_1
L4_1 = -4
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == ".iso" then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "youtube_adblocker-"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "youtube_downloader-"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 == nil then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "winrar-"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 == nil then
        L3_1 = L1_1
        L2_1 = L1_1.find
        L4_1 = "vkd-"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 == nil then
          L3_1 = L1_1
          L2_1 = L1_1.find
          L4_1 = "earsbassboost-"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 == nil then
            goto lbl_96
          end
        end
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_96::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
