local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
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
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p2
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[1]
    L5_1 = L5_1.utf8p2
    if L5_1 ~= "" then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[1]
      L3_1 = L5_1.utf8p2
  end
end
else
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L3_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = {}
L6_1 = ".nib"
L7_1 = ".png"
L8_1 = ".jpeg"
L9_1 = ".jpg"
L10_1 = ".pdf"
L11_1 = ".docx"
L12_1 = ".dmg"
L13_1 = ".pkg"
L14_1 = ".doc"
L15_1 = ".ppt"
L16_1 = ".pptx"
L17_1 = ".xls"
L18_1 = ".xlsx"
L19_1 = ".mp4"
L20_1 = ".mp3"
L21_1 = ".heif"
L22_1 = ".mkv"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L5_1[6] = L11_1
L5_1[7] = L12_1
L5_1[8] = L13_1
L5_1[9] = L14_1
L5_1[10] = L15_1
L5_1[11] = L16_1
L5_1[12] = L17_1
L5_1[13] = L18_1
L5_1[14] = L19_1
L5_1[15] = L20_1
L5_1[16] = L21_1
L5_1[17] = L22_1
L6_1 = string
L6_1 = L6_1.find
L7_1 = L4_1
L8_1 = "/contents/macos/"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = string
  L6_1 = L6_1.match
  L7_1 = L4_1
  L8_1 = "(.-)/contents"
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = pairs
  L8_1 = L5_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = string
    L12_1 = L12_1.len
    L13_1 = L11_1
    L12_1 = L12_1(L13_1)
    if L11_1 ~= nil then
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L6_1
      L15_1 = L11_1
      L16_1 = -L12_1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 then
        L13_1 = sysio
        L13_1 = L13_1.IsFileExists
        L14_1 = L3_1
        L13_1 = L13_1(L14_1)
        if L13_1 then
          L13_1 = bm
          L13_1 = L13_1.add_threat_file
          L14_1 = L3_1
          L13_1(L14_1)
        end
        L13_1 = SuspMacPathsToMonitor
        L14_1 = L2_1
        L15_1 = true
        L13_1 = L13_1(L14_1, L15_1)
        if not L13_1 then
          L13_1 = string
          L13_1 = L13_1.find
          L14_1 = L2_1
          L15_1 = "/Users/[^/]+/Downloads/"
          L16_1 = 1
          L17_1 = false
          L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
          if not L13_1 then
            L13_1 = string
            L13_1 = L13_1.find
            L14_1 = L2_1
            L15_1 = "/Users/[^/]+/Documents/"
            L16_1 = 1
            L17_1 = false
            L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
            if not L13_1 then
              L13_1 = string
              L13_1 = L13_1.find
              L14_1 = L2_1
              L15_1 = "/Users/[^/]+/Desktop/"
              L16_1 = 1
              L17_1 = false
              L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
              if not L13_1 then
                goto lbl_147
              end
            end
          end
        end
        L13_1 = mp
        L13_1 = L13_1.INFECTED
        return L13_1
      end
    end
    ::lbl_147::
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
