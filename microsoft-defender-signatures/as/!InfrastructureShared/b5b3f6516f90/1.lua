local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L3_1 = 1
L4_1 = mp
L4_1 = L4_1.SIGATTR_LOG_SZ
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = sigattr_head
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.matched
  if L7_1 then
    L7_1 = sigattr_head
    L7_1 = L7_1[L6_1]
    L7_1 = L7_1.attribute
    if L7_1 == 16401 then
      L7_1 = sigattr_head
      L7_1 = L7_1[L6_1]
      L7_1 = L7_1.utf8p1
      if L7_1 ~= nil then
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = sigattr_head
        L8_1 = L8_1[L6_1]
        L8_1 = L8_1.utf8p1
        L7_1 = L7_1(L8_1)
        L0_1 = L7_1
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = sigattr_head
        L8_1 = L8_1[L6_1]
        L8_1 = L8_1.utf8p2
        L7_1 = L7_1(L8_1)
        L1_1 = L7_1
        L7_1 = sigattr_head
        L7_1 = L7_1[L6_1]
        L2_1 = L7_1.ppid
        break
      end
    end
  end
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L0_1 == nil or L1_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = #L0_1
if 1 <= L3_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = 1
  L6_1 = 1
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == "%" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContextNoPath
L4_1 = L2_1
L5_1 = "FilePersistContextToProcessRelay.B"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = false
L4_1 = string
L4_1 = L4_1.match
L5_1 = L0_1
L6_1 = "([^\\]+)$"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.GetExecutablesFromCommandLine
L6_1 = L1_1
L5_1 = L5_1(L6_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = ipairs
L7_1 = L5_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = string
  L11_1 = L11_1.sub
  L12_1 = L10_1
  L13_1 = #L4_1
  L13_1 = -L13_1
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 ~= L4_1 then
    L11_1 = sysio
    L11_1 = L11_1.IsFileExists
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L11_1 = MpCommon
      L11_1 = L11_1.GetPersistContextCount
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      if 0 < L11_1 and L11_1 <= 100 then
        L12_1 = MpCommon
        L12_1 = L12_1.GetPersistContext
        L13_1 = L10_1
        L12_1 = L12_1(L13_1)
        L13_1 = ipairs
        L14_1 = L12_1
        L13_1, L14_1, L15_1 = L13_1(L14_1)
        for L16_1, L17_1 in L13_1, L14_1, L15_1 do
          L18_1 = #L17_1
          if 4 <= L18_1 then
            L18_1 = string
            L18_1 = L18_1.match
            L19_1 = L17_1
            L20_1 = "^[tT][0-9][0-9][0-9][0-9]"
            L18_1 = L18_1(L19_1, L20_1)
            if L18_1 then
              L18_1 = string
              L18_1 = L18_1.match
              L19_1 = L17_1
              L20_1 = "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)"
              L18_1, L19_1 = L18_1(L19_1, L20_1)
              L20_1 = TrackPidAndTechniqueBM
              L21_1 = L2_1
              L22_1 = L18_1
              L23_1 = L19_1
              L20_1(L21_1, L22_1, L23_1)
              L3_1 = true
            end
          end
        end
      end
    end
  end
end
if L3_1 == true then
  L6_1 = MpCommon
  L6_1 = L6_1.AppendPersistContextNoPath
  L7_1 = L2_1
  L8_1 = "FilePersistContextToProcessRelay.B"
  L9_1 = 0
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
