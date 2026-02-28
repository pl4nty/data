local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_21
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_21::
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = {}
L7_1 = "pdf"
L8_1 = "doc"
L9_1 = "docx"
L10_1 = "xls"
L11_1 = "xlsx"
L12_1 = "ppt"
L13_1 = "pptx"
L14_1 = "rtf"
L15_1 = "txt"
L16_1 = "one"
L17_1 = "jpg"
L18_1 = "jpeg"
L19_1 = "png"
L20_1 = "bmp"
L21_1 = "gif"
L22_1 = "mov"
L23_1 = "mp4"
L24_1 = "mp3"
L25_1 = "avi"
L26_1 = "wmv"
L27_1 = "flv"
L28_1 = "mpg"
L29_1 = "mpeg"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L6_1[5] = L11_1
L6_1[6] = L12_1
L6_1[7] = L13_1
L6_1[8] = L14_1
L6_1[9] = L15_1
L6_1[10] = L16_1
L6_1[11] = L17_1
L6_1[12] = L18_1
L6_1[13] = L19_1
L6_1[14] = L20_1
L6_1[15] = L21_1
L6_1[16] = L22_1
L6_1[17] = L23_1
L6_1[18] = L24_1
L6_1[19] = L25_1
L6_1[20] = L26_1
L6_1[21] = L27_1
L6_1[22] = L28_1
L6_1[23] = L29_1
L7_1 = this_sigattrlog
L7_1 = L7_1[2]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[2]
  L7_1 = L7_1.utf8p2
  if L7_1 ~= nil then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[2]
    L7_1 = L7_1.utf8p2
    if L7_1 ~= "" then
      L7_1 = this_sigattrlog
      L7_1 = L7_1[2]
      L3_1 = L7_1.utf8p2
  end
end
else
  L7_1 = this_sigattrlog
  L7_1 = L7_1[3]
  L7_1 = L7_1.matched
  if L7_1 then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[3]
    L7_1 = L7_1.utf8p2
    if L7_1 ~= nil then
      L7_1 = this_sigattrlog
      L7_1 = L7_1[3]
      L7_1 = L7_1.utf8p2
      if L7_1 ~= "" then
        L7_1 = this_sigattrlog
        L7_1 = L7_1[3]
        L3_1 = L7_1.utf8p2
    end
  end
  else
    L7_1 = this_sigattrlog
    L7_1 = L7_1[4]
    L7_1 = L7_1.matched
    if L7_1 then
      L7_1 = this_sigattrlog
      L7_1 = L7_1[4]
      L7_1 = L7_1.utf8p2
      if L7_1 ~= nil then
        L7_1 = this_sigattrlog
        L7_1 = L7_1[4]
        L7_1 = L7_1.utf8p2
        if L7_1 ~= "" then
          L7_1 = this_sigattrlog
          L7_1 = L7_1[4]
          L3_1 = L7_1.utf8p2
      end
    end
    else
      L7_1 = this_sigattrlog
      L7_1 = L7_1[5]
      L7_1 = L7_1.matched
      if L7_1 then
        L7_1 = this_sigattrlog
        L7_1 = L7_1[5]
        L7_1 = L7_1.utf8p2
        if L7_1 ~= nil then
          L7_1 = this_sigattrlog
          L7_1 = L7_1[5]
          L7_1 = L7_1.utf8p2
          if L7_1 ~= "" then
            L7_1 = this_sigattrlog
            L7_1 = L7_1[5]
            L3_1 = L7_1.utf8p2
          end
        end
      end
    end
  end
end
L7_1 = this_sigattrlog
L7_1 = L7_1[7]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[7]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[7]
    L7_1 = L7_1.utf8p1
    if L7_1 ~= "" then
      L7_1 = this_sigattrlog
      L7_1 = L7_1[7]
      L5_1 = L7_1.utf8p1
    end
  end
end
if L3_1 == nil or L3_1 == "" or L5_1 == nil or L5_1 == "" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.match
L8_1 = L5_1
L9_1 = "[^/]*$"
L7_1 = L7_1(L8_1, L9_1)
L4_1 = L7_1
L7_1 = string
L7_1 = L7_1.find
L8_1 = L3_1
L9_1 = L4_1
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L8_1 = L4_1
  L7_1 = L4_1.match
  L9_1 = "[^.+%.].+%.zip$"
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L8_1 = L4_1
    L7_1 = L4_1.match
    L9_1 = "[^.+%.].+%.dmg$"
    L7_1 = L7_1(L8_1, L9_1)
    if not L7_1 then
      L8_1 = L4_1
      L7_1 = L4_1.match
      L9_1 = "[^.+%.].+%.pkg$"
      L7_1 = L7_1(L8_1, L9_1)
      if not L7_1 then
        goto lbl_195
      end
    end
  end
  L8_1 = L4_1
  L7_1 = L4_1.match
  L9_1 = "[^.+]%.(.+)%.+"
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = pairs
  L9_1 = L6_1
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    if L7_1 == L12_1 then
      L13_1 = mp
      L13_1 = L13_1.INFECTED
      return L13_1
    end
  end
end
::lbl_195::
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
