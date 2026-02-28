local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 == 0 or 1000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2(L3_2, L4_2)
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L2_2 = #L1_2
  if L2_2 == 4 then
    L2_2 = pairs
    L3_2 = L1_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      L7_2 = tonumber
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if not (L7_2 < 0) then
        L7_2 = tonumber
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if not (255 < L7_2) then
          goto lbl_25
        end
      end
      L7_2 = false
      do return L7_2 end
      ::lbl_25::
    end
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "^%w[%w%.%-]*%.%w%w%w?%w?%w?$"
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 ~= nil
  return L1_2
end

L4_1 = {}
L5_1 = "https?://([%w%.%-]+)[:%d]*"
L7_1 = L1_1
L6_1 = L1_1.gmatch
L8_1 = L5_1
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
for L9_1 in L6_1, L7_1, L8_1 do
  if L9_1 then
    L10_1 = L2_1
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if not L10_1 then
      L10_1 = L3_1
      L11_1 = L9_1
      L10_1 = L10_1(L11_1)
      if not L10_1 then
        goto lbl_50
      end
    end
    L10_1 = table
    L10_1 = L10_1.insert
    L11_1 = L4_1
    L12_1 = L9_1
    L10_1(L11_1, L12_1)
  end
  ::lbl_50::
end
L6_1 = false
L7_1 = #L4_1
if 0 < L7_1 then
  L7_1 = mp
  L7_1 = L7_1.get_contextdata
  L8_1 = mp
  L8_1 = L8_1.CONTEXT_DATA_AMSI_OPERATION_PPID
  L7_1 = L7_1(L8_1)
  if L7_1 == nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = mp
  L8_1 = L8_1.GetProcessCommandLine
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if L8_1 == nil or L8_1 == "" then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = ipairs
  L10_1 = L4_1
  L9_1, L10_1, L11_1 = L9_1(L10_1)
  for L12_1, L13_1 in L9_1, L10_1, L11_1 do
    L14_1 = IsHostAttackServerCloudChk
    L15_1 = L13_1
    L16_1 = "ALF:Trojan:Script/PSUrlExtract.B"
    L17_1 = "powershell"
    L18_1 = L8_1
    L19_1 = "NOLOOKUP"
    L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1, L19_1)
    L6_1 = L14_1
    if L6_1 then
      L14_1 = string
      L14_1 = L14_1.format
      L15_1 = "scenario:powershell_attacksvr_download;attacksvr:%s"
      L16_1 = L13_1
      L14_1 = L14_1(L15_1, L16_1)
      L15_1 = TT_SendBMSigTrigger
      L16_1 = L7_1
      L17_1 = "file_from_attackerserver"
      L18_1 = L14_1
      L15_1(L16_1, L17_1, L18_1)
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
