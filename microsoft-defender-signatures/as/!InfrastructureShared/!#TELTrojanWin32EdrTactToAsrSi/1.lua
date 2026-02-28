local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 == nil or A0_2 == "" then
    L2_2 = false
    return L2_2
  end
  if A1_2 == nil or A1_2 == "" then
    L2_2 = false
    return L2_2
  end
  L2_2 = ipairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.find
    L8_2 = A0_2
    L9_2 = L6_2
    L10_2 = 1
    L11_2 = true
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    if L7_2 ~= nil then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = false
  return L2_2
end

function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 == nil or A0_2 == "" then
    L2_2 = 0
    return L2_2
  end
  if A1_2 == nil or A1_2 == "" then
    L2_2 = 0
    return L2_2
  end
  L2_2 = 0
  L3_2 = string
  L3_2 = L3_2.gmatch
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  for L6_2 in L3_2, L4_2, L5_2 do
    L2_2 = L2_2 + 1
  end
  return L2_2
end

L2_1 = mp
L2_1 = L2_1.GetScanSource
L2_1 = L2_1()
L3_1 = mp
L3_1 = L3_1.SCANSOURCE_IOAV_WEB
if L2_1 ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.SCANSOURCE_IOAV_FILE
  if L2_1 ~= L3_1 then
    L3_1 = mp
    L3_1 = L3_1.SCANSOURCE_RTP
    if L2_1 ~= L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
end
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
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILENAME
L4_1 = L4_1(L5_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = string
  L5_1 = L5_1.match
  L6_1 = L3_1
  L7_1 = "\\([^\\]+)$"
  L5_1 = L5_1(L6_1, L7_1)
  L4_1 = L5_1
  if L4_1 == nil or L4_1 == "" then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = {}
L6_1 = ".rar"
L7_1 = ".zip"
L8_1 = ".gz"
L9_1 = ".msi"
L10_1 = ".cab"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L6_1 = L0_1
L7_1 = L4_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = MpCommon
L6_1 = L6_1.PathToWin32Path
L7_1 = mp
L7_1 = L7_1.get_contextdata
L8_1 = mp
L8_1 = L8_1.CONTEXT_DATA_FILEPATH
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1 = L7_1(L8_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1)
if L6_1 == nil or L6_1 == "" then
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L3_1
  L9_1 = "(.+)\\[^\\]+$"
  L7_1 = L7_1(L8_1, L9_1)
  L6_1 = L7_1
  if L6_1 == nil or L6_1 == "" then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
L7_1 = string
L7_1 = L7_1.find
L8_1 = L6_1
L9_1 = "\\downloads$"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = {}
L8_1 = "intervals.icu"
L7_1[1] = L8_1
L8_1 = {}
L9_1 = "motorcycles/"
L10_1 = "makeup/"
L11_1 = "boats/"
L12_1 = "icu/"
L13_1 = "rest/"
L14_1 = "christmas/"
L15_1 = "yachts/"
L16_1 = "mom/"
L17_1 = "hair/"
L18_1 = "cyou/"
L19_1 = "lat/"
L20_1 = "lol/"
L21_1 = "pics/"
L22_1 = "beauty/"
L23_1 = "monster/"
L24_1 = "cfd/"
L25_1 = "autos/"
L26_1 = "buzz/"
L27_1 = "bond/"
L28_1 = "homes/"
L29_1 = "skin/"
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L8_1[4] = L12_1
L8_1[5] = L13_1
L8_1[6] = L14_1
L8_1[7] = L15_1
L8_1[8] = L16_1
L8_1[9] = L17_1
L8_1[10] = L18_1
L8_1[11] = L19_1
L8_1[12] = L20_1
L8_1[13] = L21_1
L8_1[14] = L22_1
L8_1[15] = L23_1
L8_1[16] = L24_1
L8_1[17] = L25_1
L8_1[18] = L26_1
L8_1[19] = L27_1
L8_1[20] = L28_1
L8_1[21] = L29_1
L9_1 = mp
L9_1 = L9_1.IOAVGetDownloadUrl
L9_1 = L9_1()
if L9_1 ~= nil then
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L9_1
  L12_1 = "/$"
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 ~= nil then
    L10_1 = L0_1
    L11_1 = L9_1
    L12_1 = L7_1
    L10_1 = L10_1(L11_1, L12_1)
    if not L10_1 then
      L10_1 = L0_1
      L11_1 = L9_1
      L12_1 = L8_1
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = L1_1
        L11_1 = L9_1
        L12_1 = "/"
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 == 3 then
          L10_1 = L1_1
          L11_1 = L9_1
          L12_1 = "%."
          L10_1 = L10_1(L11_1, L12_1)
          if L10_1 <= 2 then
            L10_1 = string
            L10_1 = L10_1.match
            L11_1 = L9_1
            L12_1 = "://([a-z0-9]+)%."
            L10_1 = L10_1(L11_1, L12_1)
            L11_1 = #L10_1
            if 9 <= L11_1 then
              L11_1 = string
              L11_1 = L11_1.match
              L12_1 = L9_1
              L13_1 = "%.([a-z0-9]+)/"
              L11_1 = L11_1(L12_1, L13_1)
              L12_1 = #L11_1
              if 3 <= L12_1 then
                L12_1 = mp
                L12_1 = L12_1.INFECTED
                return L12_1
              end
            end
          end
        end
      end
    end
  end
end
L10_1 = mp
L10_1 = L10_1.GetMOTWHostUrl
L10_1 = L10_1()
if L10_1 ~= nil then
  L11_1 = string
  L11_1 = L11_1.find
  L12_1 = L10_1
  L13_1 = "/$"
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 ~= nil then
    L11_1 = L0_1
    L12_1 = L10_1
    L13_1 = L7_1
    L11_1 = L11_1(L12_1, L13_1)
    if not L11_1 then
      L11_1 = L0_1
      L12_1 = L10_1
      L13_1 = L8_1
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 then
        L11_1 = L1_1
        L12_1 = L10_1
        L13_1 = "/"
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 == 3 then
          L11_1 = L1_1
          L12_1 = L10_1
          L13_1 = "%."
          L11_1 = L11_1(L12_1, L13_1)
          if L11_1 <= 2 then
            L11_1 = string
            L11_1 = L11_1.match
            L12_1 = L10_1
            L13_1 = "://([a-z0-9]+)%."
            L11_1 = L11_1(L12_1, L13_1)
            L12_1 = #L11_1
            if 9 <= L12_1 then
              L12_1 = string
              L12_1 = L12_1.match
              L13_1 = L10_1
              L14_1 = "%.([a-z0-9]+)/"
              L12_1 = L12_1(L13_1, L14_1)
              L13_1 = #L12_1
              if 3 <= L13_1 then
                L13_1 = mp
                L13_1 = L13_1.INFECTED
                return L13_1
              end
            end
          end
        end
      end
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
