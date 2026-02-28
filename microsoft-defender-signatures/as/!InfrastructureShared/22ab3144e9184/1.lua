local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1
L0_1 = 5
L1_1 = 20
L2_1 = mp
L2_1 = L2_1.SIGATTR_LOG_SZ
L3_1 = {}
L4_1 = {}
L5_1 = 0
L6_1 = {}
L6_1[".txt"] = true
L6_1[".html"] = true
L6_1[".hta"] = true
L7_1 = L2_1
L8_1 = 1
L9_1 = -1
for L10_1 = L7_1, L8_1, L9_1 do
  L11_1 = sigattr_tail
  L11_1 = L11_1[L10_1]
  L11_1 = L11_1.attribute
  if L11_1 == 16384 then
    L11_1 = sigattr_tail
    L11_1 = L11_1[L10_1]
    L11_1 = L11_1.utf8p1
    L12_1 = L11_1
    L11_1 = L11_1.byte
    L13_1 = 1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= 37 then
      L11_1 = sigattr_tail
      L11_1 = L11_1[L10_1]
      L11_1 = L11_1.utf8p1
      L12_1 = L11_1
      L11_1 = L11_1.lower
      L11_1 = L11_1(L12_1)
      L13_1 = L11_1
      L12_1 = L11_1.match
      L14_1 = "[^\\]+$"
      L12_1 = L12_1(L13_1, L14_1)
      L13_1 = isnull
      L14_1 = L12_1
      L13_1 = L13_1(L14_1)
      if not L13_1 then
        L14_1 = L12_1
        L13_1 = L12_1.match
        L15_1 = "%.[^%.]+$"
        L13_1 = L13_1(L14_1, L15_1)
        L14_1 = isnull
        L15_1 = L13_1
        L14_1 = L14_1(L15_1)
        if not L14_1 then
          L14_1 = L6_1[L13_1]
          if L14_1 == true then
            L14_1 = L3_1[L12_1]
            if L14_1 ~= nil then
              L14_1 = table
              L14_1 = L14_1.insert
              L15_1 = L3_1[L12_1]
              L16_1 = L11_1
              L14_1(L15_1, L16_1)
            else
              L14_1 = {}
              L15_1 = L11_1
              L14_1[1] = L15_1
              L3_1[L12_1] = L14_1
            end
            L14_1 = L3_1[L12_1]
            L14_1 = #L14_1
            if L0_1 <= L14_1 then
              L14_1 = {}
              L15_1 = 1
              L16_1 = L3_1[L12_1]
              L16_1 = #L16_1
              L17_1 = 1
              for L18_1 = L15_1, L16_1, L17_1 do
                L19_1 = sysio
                L19_1 = L19_1.GetFileSize
                L20_1 = L3_1[L12_1]
                L20_1 = L20_1[L18_1]
                L19_1 = L19_1(L20_1)
                if L19_1 < 400 or 8000 < L19_1 then
                  L3_1[L12_1] = nil
                  break
                end
                L20_1 = L3_1[L12_1]
                L20_1 = L20_1[L18_1]
                L20_1 = L4_1[L20_1]
                if L20_1 ~= nil then
                  break
                else
                  L20_1 = L3_1[L12_1]
                  L20_1 = L20_1[L18_1]
                  L4_1[L20_1] = true
                end
                L20_1 = L14_1[L19_1]
                if L20_1 ~= nil then
                  L20_1 = L14_1[L19_1]
                  L20_1 = L20_1 + 1
                  L14_1[L19_1] = L20_1
                else
                  L14_1[L19_1] = 1
                end
                L20_1 = L14_1[L19_1]
                L21_1 = L3_1[L12_1]
                L21_1 = #L21_1
                if L20_1 == L21_1 then
                  L20_1 = bm
                  L20_1 = L20_1.get_current_process_startup_info
                  L20_1 = L20_1()
                  L21_1 = string
                  L21_1 = L21_1.lower
                  L22_1 = MpCommon
                  L22_1 = L22_1.PathToWin32Path
                  L23_1 = bm
                  L23_1 = L23_1.get_imagepath
                  L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1 = L23_1()
                  L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1 = L22_1(L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1)
                  L21_1 = L21_1(L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1)
                  L22_1 = ""
                  if L20_1 ~= nil then
                    L22_1 = L20_1.command_line
                  else
                    L20_1 = -1
                  end
                  L23_1 = {}
                  L23_1.cur_image_path = L21_1
                  L23_1.cmd_line = L22_1
                  L24_1 = {}
                  L24_1.file_size = L19_1
                  L25_1 = L3_1[L12_1]
                  L24_1.file_paths = L25_1
                  L24_1.proc_meta_info = L23_1
                  L25_1 = safeJsonSerialize
                  L26_1 = L24_1
                  L25_1 = L25_1(L26_1)
                  L26_1 = bm
                  L26_1 = L26_1.add_related_string
                  L27_1 = "gen_ransom_note"
                  L28_1 = L25_1
                  L29_1 = bm
                  L29_1 = L29_1.RelatedStringBMReport
                  L26_1(L27_1, L28_1, L29_1)
                  L26_1 = sms_untrusted_process
                  L26_1()
                  L26_1 = mp
                  L26_1 = L26_1.INFECTED
                  return L26_1
                end
              end
            end
            L5_1 = L5_1 + 1
          end
        end
      end
    end
  end
end
if L1_1 < L5_1 then
  L7_1 = bm
  L7_1 = L7_1.trigger_sig
  L8_1 = "Exclude"
  L9_1 = "NoRansomDrop"
  L7_1(L8_1, L9_1)
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
