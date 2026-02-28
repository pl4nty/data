local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L1_1 then
    goto lbl_15
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsExcludedByImagePathMacOS
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = macos
L2_1 = L2_1.GetDownloadUrl
L2_1 = L2_1()
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "^(%w+)://([^:/]+)"
L3_1, L4_1 = L3_1(L4_1, L5_1)
if L3_1 == "" or L3_1 == nil or L4_1 == "" or L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L3_1
L6_1 = "://"
L7_1 = L4_1
L5_1 = L5_1 .. L6_1 .. L7_1
L6_1 = mp
L6_1 = L6_1.CheckUrl
L7_1 = L5_1
L6_1, L7_1 = L6_1(L7_1)
if L6_1 == 1 and L7_1 == 1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = {}
L8_1.SIG_CONTEXT = "LUA_GENERIC"
L8_1.TAG = "MAC_INITIAL_ACCESS"
L9_1 = SafeGetUrlReputation
L10_1 = {}
L11_1 = L5_1
L10_1[1] = L11_1
L11_1 = L8_1
L12_1 = false
L13_1 = 2000
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if L9_1 then
  L10_1 = L9_1.urls
  L10_1 = L10_1[L5_1]
  if L10_1 then
    L10_1 = L9_1.urls
    L10_1 = L10_1[L5_1]
    L10_1 = L10_1.determination
    if L10_1 ~= 2 then
      L10_1 = L9_1.urls
      L10_1 = L10_1[L5_1]
      L10_1 = L10_1.determination
      if L10_1 ~= 3 then
        L10_1 = L9_1.urls
        L10_1 = L10_1[L5_1]
        L10_1 = L10_1.determination
        if L10_1 ~= 5 then
          L10_1 = L9_1.urls
          L10_1 = L10_1[L5_1]
          L10_1 = L10_1.determination
          if L10_1 ~= 6 then
            L10_1 = L9_1.urls
            L10_1 = L10_1[L5_1]
            L10_1 = L10_1.determination
            if L10_1 ~= 7 then
              goto lbl_126
            end
          end
        end
      end
    end
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
::lbl_126::
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
