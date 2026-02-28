local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = nil
if L0_1 then
  L3_1 = ipairs
  L4_1 = L0_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.ppid
    if L8_1 then
      L8_1 = L7_1.image_path
      if L8_1 then
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = L7_1.image_path
        L8_1 = L8_1(L9_1)
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "onedrive.exe"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if not L9_1 then
          L9_1 = string
          L9_1 = L9_1.find
          L10_1 = L8_1
          L11_1 = "onedrivestandaloneupdater.exe"
          L12_1 = 1
          L13_1 = true
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if not L9_1 then
            goto lbl_181
          end
        end
        L9_1 = mp
        L9_1 = L9_1.bitand
        L10_1 = L7_1.reason_ex
        L11_1 = 1
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 == 1 then
          L9_1 = bm
          L9_1 = L9_1.add_related_file
          L10_1 = L8_1
          L9_1(L10_1)
          L9_1 = mp
          L9_1 = L9_1.IsKnownFriendlyFile
          L10_1 = L8_1
          L11_1 = true
          L12_1 = false
          L9_1 = L9_1(L10_1, L11_1, L12_1)
          if L9_1 then
            L9_1 = bm
            L9_1 = L9_1.add_related_string
            L10_1 = "OFN"
            L11_1 = "OriginalOneDriveFile"
            L12_1 = bm
            L12_1 = L12_1.RelatedStringBMReport
            L9_1(L10_1, L11_1, L12_1)
          else
            L9_1 = MpCommon
            L9_1 = L9_1.GetOriginalFileName
            L10_1 = L8_1
            L9_1 = L9_1(L10_1)
            L2_1 = L9_1
            if not L2_1 then
              L9_1 = sysio
              L9_1 = L9_1.GetPEVersionInfo
              L10_1 = L8_1
              L9_1 = L9_1(L10_1)
              if L9_1 then
                L10_1 = L9_1.OriginalFilename
                if L10_1 then
                  L2_1 = L9_1.OriginalFilename
                end
              end
            end
            if L2_1 then
              L9_1 = bm
              L9_1 = L9_1.add_related_string
              L10_1 = "OFN"
              L11_1 = L2_1
              L12_1 = bm
              L12_1 = L12_1.RelatedStringBMReport
              L9_1(L10_1, L11_1, L12_1)
              L9_1 = contains
              L10_1 = string
              L10_1 = L10_1.lower
              L11_1 = L2_1
              L10_1 = L10_1(L11_1)
              L11_1 = "onedrive"
              L9_1 = L9_1(L10_1, L11_1)
              if not L9_1 then
                L9_1 = bm
                L9_1 = L9_1.trigger_sig
                L10_1 = "OneDriveMasqueraded"
                L11_1 = L2_1
                L9_1(L10_1, L11_1)
              end
            end
          end
          L9_1 = {}
          L10_1 = add_parents
          L10_1 = L10_1()
          L11_1 = add_parents_mp
          L11_1 = L11_1()
          L9_1.parents_info = L10_1
          L9_1.parents_info_mp = L11_1
          L12_1 = this_sigattrlog
          L12_1 = L12_1[14]
          L12_1 = L12_1.matched
          if L12_1 then
            L12_1 = this_sigattrlog
            L12_1 = L12_1[14]
            L12_1 = L12_1.utf8p2
            if L12_1 then
              L12_1 = this_sigattrlog
              L12_1 = L12_1[14]
              L12_1 = L12_1.timestamp
              L9_1.BM_Parent_TimeStamp = L12_1
          end
          else
            L12_1 = this_sigattrlog
            L12_1 = L12_1[15]
            L12_1 = L12_1.matched
            if L12_1 then
              L12_1 = this_sigattrlog
              L12_1 = L12_1[15]
              L12_1 = L12_1.utf8p2
              if L12_1 then
                L12_1 = this_sigattrlog
                L12_1 = L12_1[15]
                L12_1 = L12_1.timestamp
                L9_1.BM_Parent_TimeStamp = L12_1
              end
            end
          end
          L12_1 = bm
          L12_1 = L12_1.add_related_string
          L13_1 = "Debug_Info"
          L14_1 = safeJsonSerialize
          L15_1 = L9_1
          L14_1 = L14_1(L15_1)
          L15_1 = bm
          L15_1 = L15_1.RelatedStringBMReport
          L12_1(L13_1, L14_1, L15_1)
          L12_1 = ipairs
          L13_1 = L11_1
          L12_1, L13_1, L14_1 = L12_1(L13_1)
          for L15_1, L16_1 in L12_1, L13_1, L14_1 do
            L17_1 = L16_1.ImagePath
            if L17_1 then
              L17_1 = string
              L17_1 = L17_1.lower
              L18_1 = L16_1.ImagePath
              L17_1 = L17_1(L18_1)
              L18_1 = contains
              L19_1 = L17_1
              L20_1 = "onedrive"
              L18_1 = L18_1(L19_1, L20_1)
              if L18_1 then
                L18_1 = bm
                L18_1 = L18_1.trigger_sig
                L19_1 = "SuspChild_Onedrive"
                L20_1 = L2_1 or L20_1
                if not L2_1 then
                  L20_1 = "OriginalOneDriveFile"
                end
                L18_1(L19_1, L20_1)
                break
              end
            end
          end
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          return L12_1
        end
      end
    end
    ::lbl_181::
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
