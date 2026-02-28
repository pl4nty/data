local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L1_1 = "|.js|jse|vbs|vbe|"
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L0_1 = L2_1.utf8p2
    end
  end
end
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetExecutablesFromCommandLine
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = sysio
  L8_1 = L8_1.IsFileExists
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L8_1 = checkFileLastWriteTime
    L9_1 = L7_1
    L10_1 = 600
    L8_1 = L8_1(L9_1, L10_1)
    if L8_1 ~= false then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = string
    L9_1 = L9_1.sub
    L10_1 = L7_1
    L11_1 = -3
    L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L9_1(L10_1, L11_1)
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L1_1
    L11_1 = L8_1
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.GetMotwReferrerUrlForFile
      L10_1 = L7_1
      L9_1, L10_1 = L9_1(L10_1)
      if not L9_1 then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      if L10_1 then
        L11_1 = {}
        L11_1.SIG_CONTEXT = "ScriptDropPE"
        L11_1.CONTENT_SOURCE = "ScriptDropPE"
        L11_1.TAG = "INTERFLOW"
        L12_1 = SafeGetUrlReputation
        L13_1 = {}
        L14_1 = L10_1
        L13_1[1] = L14_1
        L14_1 = L11_1
        L15_1 = false
        L16_1 = 2000
        L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
        L13_1 = L12_1.urls
        L13_1 = L13_1[L10_1]
        if L13_1 then
          L13_1 = L12_1.urls
          L13_1 = L13_1[L10_1]
          L13_1 = L13_1.determination
          if L13_1 ~= 1 then
            L13_1 = L12_1.urls
            L13_1 = L13_1[L10_1]
            L13_1 = L13_1.confidence
            if L13_1 ~= 90 then
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
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
