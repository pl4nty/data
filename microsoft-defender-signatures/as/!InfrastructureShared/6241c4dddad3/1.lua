local L0_1, L1_1, L2_1, L3_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L0_2 = reportHeaders
  L1_2 = {}
  L2_2 = "Host"
  L3_2 = "User-Agent"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L0_2(L1_2)
  L0_2 = this_sigattrlog
  L0_2 = L0_2[1]
  L0_2 = L0_2.utf8p1
  L1_2 = this_sigattrlog
  L1_2 = L1_2[1]
  L1_2 = L1_2.np2
  L2_2 = this_sigattrlog
  L2_2 = L2_2[2]
  L3_2 = this_sigattrlog
  L3_2 = L3_2[3]
  L4_2 = nri
  L4_2 = L4_2.GetURI
  L4_2 = L4_2()
  L5_2 = L2_2.utf8p1
  if L5_2 then
    L5_2 = L2_2.utf8p2
    if L5_2 then
      L5_2 = L3_2.utf8p1
      if L5_2 then
        goto lbl_36
      end
    end
  end
  L5_2 = mp
  L5_2 = L5_2.changedetectionname
  L6_2 = 805306718
  L5_2(L6_2)
  L5_2 = mp
  L5_2 = L5_2.INFECTED
  do return L5_2 end
  ::lbl_36::
  L5_2 = {}
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "NP:%s:%d"
  L8_2 = L2_2.utf8p1
  L9_2 = L2_2.np2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2.SIG_CONTEXT = L6_2
  L5_2.CONTENT_SOURCE = "NP"
  L6_2 = L3_2.utf8p1
  L5_2.PROCESS_PATH = L6_2
  L5_2.C2 = "true"
  L6_2 = L0_2
  L7_2 = ":"
  L8_2 = L1_2
  L6_2 = L6_2 .. L7_2 .. L8_2
  L7_2 = mp
  L7_2 = L7_2.GetUrlReputation
  L8_2 = {}
  L9_2 = L6_2
  L10_2 = L4_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = L5_2
  L7_2 = L7_2(L8_2, L9_2)
  if not L7_2 then
    L8_2 = mp
    L8_2 = L8_2.changedetectionname
    L9_2 = 805306719
    L8_2(L9_2)
    L8_2 = mp
    L8_2 = L8_2.INFECTED
    return L8_2
  else
    L8_2 = {}
    L8_2.emotet = 805306695
    L8_2.trickbot = 805306697
    L8_2.dridex = 805306705
    L8_2.cobaltstrike = 805306707
    L8_2.qakbot = 805306709
    L8_2.zloader = 805306711
    L8_2.icedid = 805306713
    L9_2 = L7_2.urls
    L10_2 = ipairs
    L11_2 = L9_2
    L10_2, L11_2, L12_2 = L10_2(L11_2)
    for L13_2, L14_2 in L10_2, L11_2, L12_2 do
      L15_2 = L14_2.determination
      if L15_2 == 2 then
        L15_2 = L14_2.urlresponsecontext
        if L15_2 then
          L16_2 = ""
          L17_2 = ipairs
          L18_2 = L15_2
          L17_2, L18_2, L19_2 = L17_2(L18_2)
          for L20_2, L21_2 in L17_2, L18_2, L19_2 do
            L22_2 = L21_2.key
            L23_2 = L21_2.value
            if L22_2 == "MaceFamily" then
              L24_2 = string
              L24_2 = L24_2.lower
              L25_2 = L23_2
              L24_2 = L24_2(L25_2)
              L16_2 = L24_2
              break
            end
          end
          if L16_2 ~= "" then
            L17_2 = L8_2[L16_2]
            L18_2 = L14_2.confidence
            if L18_2 ~= 99 then
              L17_2 = L17_2 - 1
            end
            L18_2 = mp
            L18_2 = L18_2.changedetectionname
            L19_2 = L17_2
            L18_2(L19_2)
            L18_2 = mp
            L18_2 = L18_2.INFECTED
            return L18_2
          end
        end
      end
    end
  end
end

L1_1 = pcallEx
L2_1 = "adjustDetectionName"
L3_1 = L0_1
L1_1, L2_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L3_1 = reportPcallEx
  L3_1()
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
