local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = bm
L1_1 = L1_1.get_sig_count
L1_1 = L1_1()
L2_1 = 0
L3_1 = 0
L4_1 = {}
L5_1 = {}
L6_1 = string
L6_1 = L6_1.lower
L7_1 = MpCommon
L7_1 = L7_1.PathToWin32Path
L8_1 = bm
L8_1 = L8_1.get_imagepath
L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1 = L8_1()
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1)
if not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L8_1 = L6_1
L7_1 = L6_1.match
L9_1 = "[^\\]+$"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 or L7_1 ~= "python.exe" then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = IsProcNameInParentProcessTree
L9_1 = "BM"
L10_1 = "ai_exec_server.exe"
L8_1 = L8_1(L9_1, L10_1)
if not L8_1 then
  L8_1 = IsProcNameInParentProcessTree
  L9_1 = "BM"
  L10_1 = "airuncommandasuser.exe"
  L8_1 = L8_1(L9_1, L10_1)
  if not L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L8_1 = 1
L9_1 = L0_1
L10_1 = 1
for L11_1 = L8_1, L9_1, L10_1 do
  L12_1 = sigattr_tail
  L12_1 = L12_1[L11_1]
  L12_1 = L12_1.utf8p1
  if L12_1 then
    L12_1 = sigattr_tail
    L12_1 = L12_1[L11_1]
    L12_1 = L12_1.utf8p1
    L13_1 = L12_1
    L12_1 = L12_1.byte
    L14_1 = 1
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 ~= 37 then
      L12_1 = sigattr_tail
      L12_1 = L12_1[L11_1]
      L12_1 = L12_1.attribute
      if L12_1 == 16387 then
        L12_1 = sigattr_tail
        L12_1 = L12_1[L11_1]
        L12_1 = L12_1.utf8p1
        L13_1 = L12_1
        L12_1 = L12_1.lower
        L12_1 = L12_1(L13_1)
        L13_1 = L4_1[L12_1]
        if L13_1 == nil then
          L4_1[L12_1] = L11_1
          L2_1 = L2_1 + 1
        end
      else
        L12_1 = sigattr_tail
        L12_1 = L12_1[L11_1]
        L12_1 = L12_1.attribute
        if L12_1 == 16385 then
          L12_1 = sigattr_tail
          L12_1 = L12_1[L11_1]
          L12_1 = L12_1.utf8p1
          L13_1 = L12_1
          L12_1 = L12_1.lower
          L12_1 = L12_1(L13_1)
          L13_1 = L5_1[L12_1]
          if L13_1 == nil then
            L5_1[L12_1] = L11_1
            L3_1 = L3_1 + 1
          end
        end
      end
    end
  end
end
if L2_1 < 5 or L3_1 < 5 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = 0
L9_1 = {}
L10_1 = {}
L11_1 = 1
L12_1 = L0_1
L13_1 = 1
for L14_1 = L11_1, L12_1, L13_1 do
  L15_1 = sigattr_tail
  L15_1 = L15_1[L14_1]
  L15_1 = L15_1.attribute
  if L15_1 == 16384 then
    L15_1 = sigattr_tail
    L15_1 = L15_1[L14_1]
    L15_1 = L15_1.utf8p1
    if L15_1 then
      L15_1 = sigattr_tail
      L15_1 = L15_1[L14_1]
      L15_1 = L15_1.utf8p1
      L16_1 = L15_1
      L15_1 = L15_1.byte
      L17_1 = 1
      L15_1 = L15_1(L16_1, L17_1)
      if L15_1 ~= 37 then
        L15_1 = sigattr_tail
        L15_1 = L15_1[L14_1]
        L15_1 = L15_1.utf8p1
        L16_1 = L15_1
        L15_1 = L15_1.lower
        L15_1 = L15_1(L16_1)
        L16_1 = L10_1[L15_1]
        if L16_1 == nil then
          L10_1[L15_1] = L14_1
          L17_1 = L15_1
          L16_1 = L15_1.match
          L18_1 = "[^\\]+$"
          L16_1 = L16_1(L17_1, L18_1)
          L18_1 = L16_1
          L17_1 = L16_1.gsub
          L19_1 = "%."
          L20_1 = "."
          L17_1, L18_1 = L17_1(L18_1, L19_1, L20_1)
          if 2 <= L18_1 then
            L20_1 = L16_1
            L19_1 = L16_1.match
            L21_1 = "%.[^%.]+$"
            L19_1 = L19_1(L20_1, L21_1)
            L20_1 = L9_1[L19_1]
            if L20_1 ~= nil then
              L20_1 = table
              L20_1 = L20_1.insert
              L21_1 = L9_1[L19_1]
              L22_1 = L14_1
              L20_1(L21_1, L22_1)
            else
              L20_1 = {}
              L21_1 = L14_1
              L20_1[1] = L21_1
              L9_1[L19_1] = L20_1
            end
            L8_1 = L8_1 + 1
          end
        end
      end
    end
  end
end
if L8_1 < 5 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = {}
L12_1 = pairs
L13_1 = L9_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
for L15_1, L16_1 in L12_1, L13_1, L14_1 do
  L17_1 = L9_1[L15_1]
  L17_1 = #L17_1
  if 4 <= L17_1 then
    L17_1 = string
    L17_1 = L17_1.len
    L18_1 = L15_1
    L17_1 = L17_1(L18_1)
    L18_1 = pairs
    L19_1 = L16_1
    L18_1, L19_1, L20_1 = L18_1(L19_1)
    for L21_1, L22_1 in L18_1, L19_1, L20_1 do
      L23_1 = sigattr_tail
      L23_1 = L23_1[L22_1]
      L23_1 = L23_1.utf8p1
      L24_1 = L23_1
      L23_1 = L23_1.lower
      L23_1 = L23_1(L24_1)
      L24_1 = L4_1[L23_1]
      if L24_1 ~= nil then
        L24_1 = string
        L24_1 = L24_1.len
        L25_1 = L23_1
        L24_1 = L24_1(L25_1)
        if L17_1 < L24_1 then
          L25_1 = string
          L25_1 = L25_1.sub
          L26_1 = L23_1
          L27_1 = 1
          L28_1 = L24_1 - L17_1
          L25_1 = L25_1(L26_1, L27_1, L28_1)
          L26_1 = L5_1[L25_1]
          if L26_1 then
            L26_1 = table
            L26_1 = L26_1.insert
            L27_1 = L11_1
            L28_1 = L25_1
            L26_1(L27_1, L28_1)
            L26_1 = #L11_1
            if 4 <= L26_1 then
              L26_1 = {}
              L27_1 = pairs
              L28_1 = L11_1
              L27_1, L28_1, L29_1 = L27_1(L28_1)
              for L30_1, L31_1 in L27_1, L28_1, L29_1 do
                L32_1 = table
                L32_1 = L32_1.insert
                L33_1 = L26_1
                L34_1 = L31_1
                L32_1(L33_1, L34_1)
              end
              L27_1 = bm
              L27_1 = L27_1.get_imagepath
              L27_1 = L27_1()
              L28_1 = isnull
              L29_1 = L27_1
              L28_1 = L28_1(L29_1)
              if L28_1 then
                L27_1 = "NA"
              else
                L29_1 = L27_1
                L28_1 = L27_1.lower
                L28_1 = L28_1(L29_1)
                L27_1 = L28_1
              end
              L28_1 = bm
              L28_1 = L28_1.get_current_process_startup_info
              L28_1 = L28_1()
              L29_1 = isnull
              L30_1 = L28_1
              L29_1 = L29_1(L30_1)
              if L29_1 then
                L28_1 = "NA"
              else
                L28_1 = L28_1.ppid
              end
              L29_1 = {}
              L29_1.file_list = L26_1
              L29_1.sig_count = L1_1
              L29_1.proc_info = L28_1
              L29_1.cur_image_path = L27_1
              L30_1 = safeJsonSerialize
              L31_1 = L29_1
              L30_1 = L30_1(L31_1)
              L31_1 = bm
              L31_1 = L31_1.add_related_string
              L32_1 = "genq_ransom_meta"
              L33_1 = L30_1
              L34_1 = bm
              L34_1 = L34_1.RelatedStringBMReport
              L31_1(L32_1, L33_1, L34_1)
              L31_1 = reportGenericRansomware
              L32_1 = L30_1
              L33_1 = true
              L31_1(L32_1, L33_1)
              L31_1 = mp
              L31_1 = L31_1.INFECTED
              return L31_1
            end
          end
        end
      end
    end
  end
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
