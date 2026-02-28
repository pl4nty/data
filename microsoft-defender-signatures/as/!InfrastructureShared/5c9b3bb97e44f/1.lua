local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = 5
L3_1 = {}
L4_1 = 0
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.utf8p2
  L10_1 = sigattr_tail
  L10_1 = L10_1[L8_1]
  L10_1 = L10_1.attribute
  if L10_1 == 16385 then
    L10_1 = string
    L10_1 = L10_1.len
    L11_1 = sigattr_tail
    L11_1 = L11_1[L8_1]
    L11_1 = L11_1.utf8p1
    L10_1 = L10_1(L11_1)
    if 5 < L10_1 then
      L10_1 = sigattr_tail
      L10_1 = L10_1[L8_1]
      L10_1 = L10_1.utf8p1
      L11_1 = L10_1
      L10_1 = L10_1.byte
      L12_1 = 1
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 ~= 37 then
        L11_1 = L9_1
        L10_1 = L9_1.find
        L12_1 = "TotalSizeAppend:0"
        L13_1 = 1
        L14_1 = true
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        if L10_1 == nil then
          L10_1 = sigattr_tail
          L10_1 = L10_1[L8_1]
          L10_1 = L10_1.utf8p1
          L11_1 = L10_1
          L10_1 = L10_1.lower
          L10_1 = L10_1(L11_1)
          L12_1 = L10_1
          L11_1 = L10_1.match
          L13_1 = "%.[^%.]+$"
          L11_1 = L11_1(L12_1, L13_1)
          if L11_1 ~= nil then
            L12_1 = mp
            L12_1 = L12_1.crc32
            L13_1 = 0
            L14_1 = L10_1
            L15_1 = 1
            L16_1 = #L10_1
            L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
            L13_1 = {}
            L14_1 = L1_1[L12_1]
            if L14_1 == nil then
              L1_1[L12_1] = L8_1
              L14_1 = string
              L14_1 = L14_1.gmatch
              L15_1 = L9_1
              L16_1 = "(%w+):(%w+)"
              L14_1, L15_1, L16_1 = L14_1(L15_1, L16_1)
              for L17_1, L18_1 in L14_1, L15_1, L16_1 do
                L13_1[L17_1] = L18_1
              end
              L14_1 = L13_1.TotalSizeAppend
              if L14_1 then
                L14_1 = tonumber
                L15_1 = L13_1.TotalSizeAppend
                L14_1 = L14_1(L15_1)
                if L14_1 then
                  goto lbl_82
                end
              end
              L14_1 = 0
              ::lbl_82::
              if 16 < L14_1 then
                L15_1 = mp
                L15_1 = L15_1.CLEAN
                return L15_1
              end
              L15_1 = L13_1.LastOff
              if L15_1 then
                L15_1 = tonumber
                L16_1 = L13_1.LastOff
                L15_1 = L15_1(L16_1)
                if L15_1 then
                  goto lbl_96
                end
              end
              L15_1 = 0
              ::lbl_96::
              L16_1 = L13_1.FirstOff
              if L16_1 then
                L16_1 = tonumber
                L17_1 = L13_1.FirstOff
                L16_1 = L16_1(L17_1)
                if L16_1 then
                  goto lbl_105
                end
              end
              L16_1 = 0
              ::lbl_105::
              L17_1 = L13_1.NumWrites
              if L17_1 then
                L17_1 = tonumber
                L18_1 = L13_1.NumWrites
                L17_1 = L17_1(L18_1)
                if L17_1 then
                  goto lbl_114
                end
              end
              L17_1 = 0
              ::lbl_114::
              L18_1 = L13_1.BiggestOff
              if L18_1 then
                L18_1 = tonumber
                L19_1 = L13_1.BiggestOff
                L18_1 = L18_1(L19_1)
                if L18_1 then
                  goto lbl_123
                end
              end
              L18_1 = 0
              ::lbl_123::
              L19_1 = L13_1.SmallestOff
              if L19_1 then
                L19_1 = tonumber
                L20_1 = L13_1.SmallestOff
                L19_1 = L19_1(L20_1)
                if L19_1 then
                  goto lbl_132
                end
              end
              L19_1 = 0
              ::lbl_132::
              L20_1 = L13_1.TotalSizeWrite
              if L20_1 then
                L20_1 = tonumber
                L21_1 = L13_1.TotalSizeWrite
                L20_1 = L20_1(L21_1)
                if L20_1 then
                  goto lbl_141
                end
              end
              L20_1 = 0
              ::lbl_141::
              if L18_1 ~= 0 and L16_1 == 0 and L19_1 == 0 and L18_1 == L15_1 then
                L21_1 = L15_1 + 1
                if L21_1 == L20_1 and 0 < L17_1 and 0 < L14_1 and L14_1 < 16 then
                  L21_1 = L20_1 % 16
                  if L21_1 == 0 then
                    L21_1 = sigattr_tail
                    L21_1 = L21_1[L8_1]
                    L21_1 = L21_1.utf8p1
                    L13_1.path = L21_1
                    L3_1[L8_1] = L13_1
                    L4_1 = L4_1 + 1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L5_1 = {}
L6_1 = {}
if L2_1 <= L4_1 then
  L7_1 = pairs
  L8_1 = L3_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = false
    L13_1 = 1
    L14_1 = L0_1
    L15_1 = 1
    for L16_1 = L13_1, L14_1, L15_1 do
      L17_1 = sigattr_tail
      L17_1 = L17_1[L16_1]
      L17_1 = L17_1.attribute
      if L17_1 == 16386 then
        L17_1 = sigattr_tail
        L17_1 = L17_1[L16_1]
        L17_1 = L17_1.utf8p2
        L18_1 = sigattr_tail
        L18_1 = L18_1[L10_1]
        L18_1 = L18_1.utf8p1
        if L17_1 == L18_1 then
          L17_1 = sigattr_tail
          L17_1 = L17_1[L16_1]
          L17_1 = L17_1.utf8p1
          L18_1 = L17_1
          L17_1 = L17_1.lower
          L17_1 = L17_1(L18_1)
          L18_1 = sigattr_tail
          L18_1 = L18_1[L16_1]
          L18_1 = L18_1.utf8p2
          L19_1 = L18_1
          L18_1 = L18_1.lower
          L18_1 = L18_1(L19_1)
          L20_1 = L17_1
          L19_1 = L17_1.match
          L21_1 = "(.*[/\\])"
          L19_1 = L19_1(L20_1, L21_1)
          L20_1 = L19_1
          L19_1 = L19_1.lower
          L19_1 = L19_1(L20_1)
          L21_1 = L18_1
          L20_1 = L18_1.match
          L22_1 = "(.*[/\\])"
          L20_1 = L20_1(L21_1, L22_1)
          L21_1 = L20_1
          L20_1 = L20_1.lower
          L20_1 = L20_1(L21_1)
          if L19_1 == L20_1 then
            L22_1 = L17_1
            L21_1 = L17_1.byte
            L23_1 = #L18_1
            L23_1 = L23_1 + 1
            L21_1 = L21_1(L22_1, L23_1)
            if L21_1 ~= 58 then
              L22_1 = L17_1
              L21_1 = L17_1.match
              L23_1 = "(.+)%..+"
              L21_1 = L21_1(L22_1, L23_1)
              L22_1 = L21_1
              L21_1 = L21_1.lower
              L21_1 = L21_1(L22_1)
              L23_1 = L18_1
              L22_1 = L18_1.match
              L24_1 = "(.+)%..+"
              L22_1 = L22_1(L23_1, L24_1)
              L23_1 = L22_1
              L22_1 = L22_1.lower
              L22_1 = L22_1(L23_1)
              L24_1 = L17_1
              L23_1 = L17_1.match
              L25_1 = "%.[^%.]+$"
              L23_1 = L23_1(L24_1, L25_1)
              if L23_1 and L22_1 == L21_1 then
                L24_1 = mp
                L24_1 = L24_1.GetExtensionClass
                L25_1 = L23_1
                L24_1 = L24_1(L25_1)
                if L24_1 == 0 then
                  L24_1 = L5_1[L23_1]
                  if L24_1 ~= nil then
                    L24_1 = table
                    L24_1 = L24_1.insert
                    L25_1 = L5_1[L23_1]
                    L26_1 = L11_1
                    L24_1(L25_1, L26_1)
                  else
                    L24_1 = {}
                    L25_1 = L11_1
                    L24_1[1] = L25_1
                    L5_1[L23_1] = L24_1
                  end
                  L12_1 = true
                  break
                end
              end
            end
          end
        end
      end
    end
    if L12_1 == false then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
  end
  L7_1 = pairs
  L8_1 = L5_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = L5_1[L10_1]
    L12_1 = #L12_1
    if 4 <= L12_1 then
      L12_1 = {}
      L13_1 = 1
      L14_1 = 4
      L15_1 = 1
      for L16_1 = L13_1, L14_1, L15_1 do
        L17_1 = table
        L17_1 = L17_1.insert
        L18_1 = L12_1
        L19_1 = L5_1[L10_1]
        L19_1 = L19_1[L16_1]
        L17_1(L18_1, L19_1)
      end
      L13_1 = string
      L13_1 = L13_1.lower
      L14_1 = MpCommon
      L14_1 = L14_1.PathToWin32Path
      L15_1 = bm
      L15_1 = L15_1.get_imagepath
      L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L15_1()
      L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
      L14_1 = isnull
      L15_1 = L13_1
      L14_1 = L14_1(L15_1)
      if L14_1 then
        L13_1 = ""
      end
      L14_1 = bm
      L14_1 = L14_1.get_current_process_startup_info
      L14_1 = L14_1()
      if L14_1 ~= nil then
        L14_1 = -1
      end
      L6_1.rename_ext = L10_1
      L6_1.append_size = "1:16"
      L6_1.file_paths = L12_1
      L6_1.proc_meta_info = L14_1
      L15_1 = safeJsonSerialize
      L16_1 = L6_1
      L15_1 = L15_1(L16_1)
      L16_1 = bm
      L16_1 = L16_1.add_related_string
      L17_1 = "gen_ransom_ext_replace"
      L18_1 = L15_1
      L19_1 = bm
      L19_1 = L19_1.RelatedStringBMReport
      L16_1(L17_1, L18_1, L19_1)
      L16_1 = bm
      L16_1 = L16_1.trigger_sig
      L17_1 = "GenericRansomware:ReplaceExtension2"
      L18_1 = L15_1
      L16_1(L17_1, L18_1)
      L16_1 = reportTimingData
      L16_1()
      L16_1 = sms_untrusted_process
      L16_1()
      L16_1 = mp
      L16_1 = L16_1.INFECTED
      return L16_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
