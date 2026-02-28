local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
if L1_1 == nil or L1_1 == "" or L0_1 == nil or L0_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "/bin/"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "/system/"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= 1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "/sbin/"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= 1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = "/library/apple/"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= 1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L0_1
        L4_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 ~= 1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L0_1
          L4_1 = "/usr/"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 == 1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L0_1
            L4_1 = "/usr/local/"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            L2_1 = not L2_1
            if L2_1 == 1 then
              goto lbl_127
            end
          end
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L0_1
          L4_1 = "/applications/microsoft defender.app/"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 ~= 1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L0_1
            L4_1 = "/applications/qgis-ltr.app/contents/resources/"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L0_1
              L4_1 = "/applications/grass-"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                goto lbl_130
              end
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L0_1
              L4_1 = ".app/contents/resources/"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                goto lbl_130
              end
            end
          end
        end
      end
    end
  end
end
::lbl_127::
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_130::
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = ".nib"
L6_1 = ".png"
L7_1 = ".jpeg"
L8_1 = ".jpg"
L9_1 = ".pdf"
L10_1 = ".docx"
L11_1 = ".dmg"
L12_1 = ".pkg"
L13_1 = ".doc"
L14_1 = ".ppt"
L15_1 = ".pptx"
L16_1 = ".xls"
L17_1 = ".xlsx"
L18_1 = ".mp4"
L19_1 = ".mp3"
L20_1 = ".heif"
L21_1 = ".mkv"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L4_1[12] = L16_1
L4_1[13] = L17_1
L4_1[14] = L18_1
L4_1[15] = L19_1
L4_1[16] = L20_1
L4_1[17] = L21_1
L5_1 = pairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = string
  L10_1 = L10_1.len
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  if L9_1 ~= nil then
    L11_1 = string
    L11_1 = L11_1.find
    L12_1 = L1_1
    L13_1 = L9_1
    L14_1 = -L10_1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 then
      if L2_1 then
        L11_1 = TrackPidAndTechnique
        L12_1 = L2_1
        L13_1 = "T1036.008"
        L14_1 = "DefenseEvasion_Masquerading"
        L11_1(L12_1, L13_1, L14_1)
        L11_1 = MpCommon
        L11_1 = L11_1.BmTriggerSig
        L12_1 = L2_1
        L13_1 = "BM_SuspMacFileWithOtherExt"
        L14_1 = L3_1
        L11_1(L12_1, L13_1, L14_1)
      end
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      return L11_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
