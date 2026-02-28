local L0_1, L1_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "!ARX"
  L4_2 = 1
  L5_2 = true
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if L1_2 == nil or L2_2 == nil then
    return
  end
  L3_2 = string
  L3_2 = L3_2.len
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == 0 then
    return
  end
  L4_2 = {}
  L2_2 = L2_2 + 1
  while L3_2 > L2_2 do
    L5_2 = string
    L5_2 = L5_2.sub
    L6_2 = A0_2
    L7_2 = L2_2
    L8_2 = L2_2
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L6_2 = string
    L6_2 = L6_2.sub
    L7_2 = A0_2
    L8_2 = L2_2 + 1
    L9_2 = L2_2 + 1
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if L5_2 < "a" or "z" < L5_2 or L6_2 < "a" or "z" < L6_2 then
      break
    end
    L7_2 = L5_2
    L8_2 = L6_2
    L7_2 = L7_2 .. L8_2
    L4_2[L7_2] = true
    L2_2 = L2_2 + 2
  end
  return L4_2
end

GetARXRemediationCodes = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 ~= nil then
    L1_2 = string
    L1_2 = L1_2.match
    L2_2 = A0_2
    L3_2 = "^%a+:"
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 ~= nil then
      L2_2 = string
      L2_2 = L2_2.lower
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L1_2 = L2_2
      L2_2 = {}
      L2_2["trojan:"] = 805306673
      L2_2["browsermodifier:"] = 805306674
      L3_2 = L2_2[L1_2]
      return L3_2
    end
  end
end

GetLatentNidByThreatCategory = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = MpDetection
  L0_2 = L0_2.GetCurrentThreat
  L0_2 = L0_2()
  if L0_2 ~= nil then
    L1_2 = L0_2.Name
    if L1_2 ~= nil then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L1_2 = GetARXRemediationCodes
  L2_2 = L0_2.Name
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = GetLatentNidByThreatCategory
  L3_2 = L0_2.Name
  L2_2 = L2_2(L3_2)
  if L2_2 == nil then
    return
  end
  L3_2 = pairs
  L4_2 = L0_2.Resources
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L7_2.Schema
    if L8_2 == "file" then
      L8_2 = crypto
      L8_2 = L8_2.bitand
      L9_2 = L7_2.Type
      L10_2 = MpCommon
      L10_2 = L10_2.MPRESOURCE_TYPE_CONCRETE
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = MpCommon
      L9_2 = L9_2.MPRESOURCE_TYPE_CONCRETE
      if L8_2 == L9_2 then
        L8_2 = L1_2.ep
        if L8_2 == true then
          L8_2 = Infrastructure_ReportProductExcludedPathsInGroupPolicy
          L9_2 = L2_2
          L8_2(L9_2)
        end
      end
    end
  end
end

ARX_DetectionSpecific = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = Remediation
  L0_2 = L0_2.Threat
  if L0_2 ~= nil then
    L1_2 = L0_2.Name
    if L1_2 ~= nil then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L1_2 = GetARXRemediationCodes
  L2_2 = L0_2.Name
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = pairs
  L3_2 = L0_2.Resources
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = L6_2.Schema
    if L7_2 == "file" then
      L7_2 = crypto
      L7_2 = L7_2.bitand
      L8_2 = L6_2.Type
      L9_2 = MpCommon
      L9_2 = L9_2.MPRESOURCE_TYPE_CONCRETE
      L7_2 = L7_2(L8_2, L9_2)
      L8_2 = MpCommon
      L8_2 = L8_2.MPRESOURCE_TYPE_CONCRETE
      if L7_2 == L8_2 then
        L7_2 = L1_2.bx
        if L7_2 == true then
          L7_2 = Remediation
          L7_2 = L7_2.SetRemovalPolicy
          L8_2 = crypto
          L8_2 = L8_2.bitor
          L9_2 = Remediation
          L9_2 = L9_2.Threat
          L9_2 = L9_2.RemovalPolicy
          L10_2 = 32
          L8_2, L9_2, L10_2 = L8_2(L9_2, L10_2)
          L7_2(L8_2, L9_2, L10_2)
        end
      end
    end
  end
end

ARX_PreRemediation = L0_1
