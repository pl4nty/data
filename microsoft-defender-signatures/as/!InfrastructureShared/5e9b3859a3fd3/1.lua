local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = 0
L5_1 = 0
L6_1 = 5
L7_1 = 0
L8_1 = {}
L8_1[".log"] = true
L8_1[".ini"] = true
L8_1[".xml"] = true
L8_1[".tmp"] = true
L8_1[".dat"] = true
L8_1[".db"] = true
L8_1[".json"] = true
L9_1 = 1
L10_1 = L0_1
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L13_1 = sigattr_tail
  L13_1 = L13_1[L12_1]
  L13_1 = L13_1.utf8p2
  L14_1 = sigattr_tail
  L14_1 = L14_1[L12_1]
  L14_1 = L14_1.attribute
  if L14_1 == 16385 then
    L14_1 = string
    L14_1 = L14_1.len
    L15_1 = sigattr_tail
    L15_1 = L15_1[L12_1]
    L15_1 = L15_1.utf8p1
    L14_1 = L14_1(L15_1)
    if 5 < L14_1 then
      L14_1 = sigattr_tail
      L14_1 = L14_1[L12_1]
      L14_1 = L14_1.utf8p1
      L15_1 = L14_1
      L14_1 = L14_1.byte
      L16_1 = 1
      L14_1 = L14_1(L15_1, L16_1)
      if L14_1 ~= 37 and L13_1 then
        L15_1 = L13_1
        L14_1 = L13_1.find
        L16_1 = "TotalSizeAppend:0"
        L17_1 = 1
        L18_1 = true
        L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
        if L14_1 == nil then
          L14_1 = sigattr_tail
          L14_1 = L14_1[L12_1]
          L14_1 = L14_1.utf8p1
          L15_1 = L14_1
          L14_1 = L14_1.lower
          L14_1 = L14_1(L15_1)
          L16_1 = L14_1
          L15_1 = L14_1.match
          L17_1 = "%.[^%.]+$"
          L15_1 = L15_1(L16_1, L17_1)
          if L15_1 ~= nil then
            L16_1 = L8_1[L15_1]
            if L16_1 ~= true then
              L16_1 = L2_1[L15_1]
              if L16_1 == nil then
                L2_1[L2_1] = L12_1
                L5_1 = L5_1 + 1
              end
              L16_1 = L3_1[L14_1]
              if L16_1 == nil then
                L3_1[L14_1] = L12_1
                L16_1 = {}
                L17_1 = string
                L17_1 = L17_1.gmatch
                L18_1 = L13_1
                L19_1 = "(%w+):(%w+)"
                L17_1, L18_1, L19_1 = L17_1(L18_1, L19_1)
                for L20_1, L21_1 in L17_1, L18_1, L19_1 do
                  L16_1[L20_1] = L21_1
                end
                L17_1 = tonumber
                L18_1 = L16_1.NumWrites
                L17_1 = L17_1(L18_1)
                L18_1 = tonumber
                L19_1 = L16_1.TotalSizeWrite
                L18_1 = L18_1(L19_1)
                L19_1 = tonumber
                L20_1 = L16_1.TotalSizeAppend
                L19_1 = L19_1(L20_1)
                if L17_1 ~= nil and L18_1 ~= nil and L19_1 ~= nil and 0 < L17_1 and 0 < L18_1 and L18_1 > L19_1 and 100 < L19_1 and L19_1 < 2000 then
                  L1_1[L12_1] = L19_1
                  L7_1 = L7_1 + L19_1
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
L9_1 = {}
if 0 < L7_1 and L6_1 <= L4_1 and 3 <= L5_1 then
  L10_1 = L7_1 / L4_1
  L11_1 = 3
  L12_1 = 0
  L13_1 = pairs
  L14_1 = L1_1
  L13_1, L14_1, L15_1 = L13_1(L14_1)
  for L16_1, L17_1 in L13_1, L14_1, L15_1 do
    L18_1 = L17_1 * 100
    L18_1 = L18_1 / L10_1
    L19_1 = 100 - L11_1
    if L18_1 >= L19_1 then
      L19_1 = 100 + L11_1
      if L18_1 <= L19_1 then
        L12_1 = L12_1 + 1
        L19_1 = {}
        L20_1 = sigattr_tail
        L20_1 = L20_1[L16_1]
        L20_1 = L20_1.utf8p1
        L19_1.path = L20_1
        L19_1.appended_size = L17_1
        L20_1 = table
        L20_1 = L20_1.insert
        L21_1 = L9_1
        L22_1 = L19_1
        L20_1(L21_1, L22_1)
        if L6_1 <= L12_1 then
          L20_1 = string
          L20_1 = L20_1.lower
          L21_1 = MpCommon
          L21_1 = L21_1.PathToWin32Path
          L22_1 = bm
          L22_1 = L22_1.get_imagepath
          L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1 = L22_1()
          L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1 = L21_1(L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1)
          L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1)
          L21_1 = false
          L22_1 = -1
          L23_1 = -1
          L24_1 = -1
          L25_1 = -1
          L26_1 = {}
          L27_1 = isnull
          L28_1 = L20_1
          L27_1 = L27_1(L28_1)
          if not L27_1 then
            L27_1 = MpCommon
            L27_1 = L27_1.QueryPersistContext
            L28_1 = L20_1
            L29_1 = "NewPECreatedNoCert"
            L27_1 = L27_1(L28_1, L29_1)
            L21_1 = L27_1
            L27_1 = MpCommon
            L27_1 = L27_1.GetPersistContext
            L28_1 = L20_1
            L27_1 = L27_1(L28_1)
            L25_1 = L27_1
            if L25_1 ~= nil then
              L27_1 = ipairs
              L28_1 = L25_1
              L27_1, L28_1, L29_1 = L27_1(L28_1)
              for L30_1, L31_1 in L27_1, L28_1, L29_1 do
                L32_1 = tonumber
                L33_1 = string
                L33_1 = L33_1.match
                L34_1 = L31_1
                L35_1 = "^Age:([0-9]+)$"
                L33_1, L34_1, L35_1, L36_1 = L33_1(L34_1, L35_1)
                L32_1 = L32_1(L33_1, L34_1, L35_1, L36_1)
                if L32_1 ~= nil and L22_1 < L32_1 then
                  L22_1 = L32_1
                end
                L33_1 = tonumber
                L34_1 = string
                L34_1 = L34_1.match
                L35_1 = L31_1
                L36_1 = "^Prevalence:([0-9]+)$"
                L34_1, L35_1, L36_1 = L34_1(L35_1, L36_1)
                L33_1 = L33_1(L34_1, L35_1, L36_1)
                if L33_1 ~= nil and L24_1 < L33_1 then
                  L24_1 = L33_1
                end
              end
            end
            L27_1 = sysio
            L27_1 = L27_1.GetFileLastWriteTime
            L28_1 = L20_1
            L27_1 = L27_1(L28_1)
            L23_1 = L27_1
            L27_1 = sysio
            L27_1 = L27_1.GetLastResult
            L27_1 = L27_1()
            L27_1 = L27_1.Success
            if L27_1 and L23_1 ~= 0 then
              L27_1 = MpCommon
              L27_1 = L27_1.GetCurrentTimeT
              L27_1 = L27_1()
              L28_1 = L23_1 / 10000000
              L28_1 = L28_1 - 11644473600
              L23_1 = L27_1 - L28_1
            else
              L23_1 = -1
            end
          else
            L20_1 = ""
          end
          L27_1 = bm
          L27_1 = L27_1.get_current_process_startup_info
          L27_1 = L27_1()
          L28_1 = ""
          if L27_1 ~= nil then
            L28_1 = L27_1.command_line
          else
            L27_1 = -1
          end
          L29_1 = {}
          L29_1.cur_image_path = L20_1
          L29_1.cmd_line = L28_1
          L29_1.newpe_nocert = L21_1
          L29_1.elapsed_time = L23_1
          L29_1.file_age = L22_1
          L29_1.file_prevlence = L24_1
          L26_1.avg_append_size = L10_1
          L26_1.file_paths = L9_1
          L26_1.proc_meta_info = L29_1
          L30_1 = safeJsonSerialize
          L31_1 = L26_1
          L30_1 = L30_1(L31_1)
          L31_1 = bm
          L31_1 = L31_1.add_related_string
          L32_1 = "genfd_ransom_meta"
          L33_1 = L30_1
          L34_1 = bm
          L34_1 = L34_1.RelatedStringBMReport
          L31_1(L32_1, L33_1, L34_1)
          L31_1 = bm
          L31_1 = L31_1.trigger_sig
          L32_1 = "GenericRansomware:FileAppendAvg"
          L33_1 = L30_1
          L31_1(L32_1, L33_1)
          L31_1 = reportTimingData
          L31_1()
          L31_1 = sms_untrusted_process
          L31_1()
          L31_1 = mp
          L31_1 = L31_1.INFECTED
          return L31_1
        end
      end
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
