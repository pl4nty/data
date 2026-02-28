local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 20480 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "BM_LNK_FILE"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "PACKED_WITH:[CMDEmbedded]"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = tostring
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 64
L4_1 = L0_1 - 64
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "Lua:LNK_Settings!IsUnicode"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "%z"
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = {}
L3_1 = 0
L5_1 = L1_1
L4_1 = L1_1.gmatch
L6_1 = "[sS][Ee][Tt] [%w]+%s*=%s*[%w%.]+"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
for L7_1 in L4_1, L5_1, L6_1 do
  L9_1 = L7_1
  L8_1 = L7_1.match
  L10_1 = "([sS][Ee][Tt] [%w.]+)"
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L9_1 = #L8_1
    if 5 < L9_1 then
      L9_1 = string
      L9_1 = L9_1.sub
      L10_1 = L8_1
      L11_1 = 5
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 == nil then
        L10_1 = mp
        L10_1 = L10_1.CLEAN
        return L10_1
      end
      L10_1 = L2_1[L9_1]
      if L10_1 ~= 1 then
        L10_1 = "%"
        L11_1 = L9_1
        L12_1 = "%"
        L10_1 = L10_1 .. L11_1 .. L12_1
        L11_1 = "!"
        L12_1 = L9_1
        L13_1 = "!"
        L11_1 = L11_1 .. L12_1 .. L13_1
        L12_1 = "%"
        L13_1 = L9_1
        L14_1 = ":"
        L12_1 = L12_1 .. L13_1 .. L14_1
        L2_1[L9_1] = 1
        L14_1 = L1_1
        L13_1 = L1_1.find
        L15_1 = L10_1
        L16_1 = 1
        L17_1 = true
        L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
        if L13_1 ~= nil then
          L3_1 = L3_1 + 1
          L13_1 = mp
          L13_1 = L13_1.set_mpattribute
          L14_1 = "Lua:LnkHasEnvWithPercent"
          L13_1(L14_1)
        else
          L14_1 = L1_1
          L13_1 = L1_1.find
          L15_1 = L11_1
          L16_1 = 1
          L17_1 = true
          L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
          if L13_1 ~= nil then
            L3_1 = L3_1 + 1
            L13_1 = mp
            L13_1 = L13_1.set_mpattribute
            L14_1 = "Lua:LnkHasEnvWithBang"
            L13_1(L14_1)
          else
            L14_1 = L1_1
            L13_1 = L1_1.find
            L15_1 = L12_1
            L16_1 = 1
            L17_1 = true
            L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
            if L13_1 ~= nil then
              L3_1 = L3_1 + 1
              L13_1 = mp
              L13_1 = L13_1.set_mpattribute
              L14_1 = "Lua:LnkHasEnvWithPercentColon"
              L13_1(L14_1)
            end
          end
        end
        if 2 < L3_1 then
          L13_1 = mp
          L13_1 = L13_1.INFECTED
          return L13_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
