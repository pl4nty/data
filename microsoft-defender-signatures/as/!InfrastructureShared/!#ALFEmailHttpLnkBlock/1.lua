local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.GetNormalizedScript
L1_1 = true
L0_1 = L0_1(L1_1)
L1_1 = {}
L1_1.png = true
L1_1.gif = true
L1_1.jpg = true
L1_1.jpeg = true
L1_1.bmp = true
L1_1.svg = true
L1_1.ico = true
L1_1.webp = true
L1_1.woff = true
L1_1.woff2 = true
L1_1.ttf = true
L1_1.eot = true
L1_1.otf = true
L1_1.css = true
L1_1.json = true
L1_1.txt = true
L2_1 = {}
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L0_1
L5_1 = "[Hh][Tt][Tt][Pp][Ss]?://[%w-_%./%%=]+"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  L7_1 = string
  L7_1 = L7_1.gsub
  L8_1 = L6_1
  L9_1 = "[/]+$"
  L10_1 = ""
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  L6_1 = L7_1
  L8_1 = L6_1
  L7_1 = L6_1.match
  L9_1 = "%.(%w+)$"
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    L9_1 = L7_1
    L8_1 = L7_1.lower
    L8_1 = L8_1(L9_1)
    L7_1 = L8_1
  end
  L8_1 = #L6_1
  if 10 < L8_1 then
    L8_1 = L1_1[L7_1]
    if not L8_1 then
      L8_1 = table
      L8_1 = L8_1.insert
      L9_1 = L2_1
      L10_1 = L6_1
      L8_1(L9_1, L10_1)
    end
  end
end
if L2_1 ~= nil then
  L3_1 = #L2_1
  if L3_1 ~= 0 then
    goto lbl_65
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_65::
L3_1 = table_dedup
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = {}
L4_1 = {}
L5_1 = ipairs
L6_1 = L2_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = mp
  L10_1 = L10_1.CheckUrl
  L11_1 = L9_1
  L12_1 = 2
  L10_1, L11_1 = L10_1(L11_1, L12_1)
  if L11_1 == 1 then
    L12_1 = table
    L12_1 = L12_1.insert
    L13_1 = L3_1
    L14_1 = L9_1
    L12_1(L13_1, L14_1)
    L13_1 = L9_1
    L12_1 = L9_1.match
    L14_1 = "^[^/]+//([^/]+)"
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 then
      L13_1 = L4_1[L12_1]
      if L13_1 then
        L13_1 = L4_1[L12_1]
        L13_1 = L13_1 + 1
        L4_1[L12_1] = L13_1
      else
        L4_1[L12_1] = 1
      end
    end
  end
end
if L3_1 ~= nil then
  L5_1 = #L3_1
  if L5_1 ~= 0 then
    goto lbl_110
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_110::
L5_1 = {}
L6_1 = 1
L7_1 = math_min
L8_1 = 10
L9_1 = #L3_1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = #L5_1
  L10_1 = L10_1 + 1
  L11_1 = L3_1[L9_1]
  L5_1[L10_1] = L11_1
end
L6_1 = set_research_data
L7_1 = "SuspUrls"
L8_1 = MpCommon
L8_1 = L8_1.Base64Encode
L9_1 = safeJsonSerialize
L10_1 = L5_1
L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L9_1(L10_1)
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L9_1 = false
L6_1(L7_1, L8_1, L9_1)
L6_1 = set_research_data
L7_1 = "SuspDomains"
L8_1 = MpCommon
L8_1 = L8_1.Base64Encode
L9_1 = safeJsonSerialize
L10_1 = L4_1
L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L9_1(L10_1)
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L9_1 = false
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
