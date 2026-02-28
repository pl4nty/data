local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isexe
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = "enghipscpy:blockexecution:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContext
L3_1 = L1_1
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_DEVICE_CHARACTERISTICS
  L2_1 = L2_1(L3_1)
  L3_1 = mp
  L3_1 = L3_1.bitand
  L4_1 = L2_1
  L5_1 = 264193
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= 264193 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = MpCommon
  L3_1 = L3_1.ExpandEnvironmentVariables
  L4_1 = "%systemdrive%"
  L3_1 = L3_1(L4_1)
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
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "^"
  L7_1 = L3_1
  L6_1 = L6_1 .. L7_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.IsPathExcludedForHipsRule
L3_1 = L1_1
L4_1 = "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.GetPersistContextCount
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == 0 then
  L2_1 = {}
  L3_1 = table
  L3_1 = L3_1.insert
  L4_1 = L2_1
  L5_1 = L0_1
  L3_1(L4_1, L5_1)
  L3_1 = MpCommon
  L3_1 = L3_1.SetPersistContext
  L4_1 = L1_1
  L5_1 = L2_1
  L6_1 = 0
  L3_1(L4_1, L5_1, L6_1)
else
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L1_1
  L4_1 = L0_1
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = MpCommon
    L2_1 = L2_1.AppendPersistContext
    L3_1 = L1_1
    L4_1 = L0_1
    L5_1 = 0
    L2_1(L3_1, L4_1, L5_1)
  end
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "MpDisableCaching"
L2_1(L3_1)
L2_1 = versioning
L2_1 = L2_1.GetOsBuildNumber
L2_1 = L2_1()
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_SCANREASON
L3_1 = L3_1(L4_1)
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONOPEN
if L3_1 == L4_1 then
  L3_1 = peattributes
  L3_1 = L3_1.isdll
  if L3_1 then
    L3_1 = {}
    L3_1["rundll32.exe"] = true
    L3_1["regsvr32.exe"] = true
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L6_1 = L4_1
      L5_1 = L4_1.lower
      L5_1 = L5_1(L6_1)
      L5_1 = L3_1[L5_1]
      if L5_1 == true then
        L5_1 = mp
        L5_1 = L5_1.IsTrustedFile
        L6_1 = false
        L5_1, L6_1 = L5_1(L6_1)
        if L5_1 == false then
          L7_1 = mp
          L7_1 = L7_1.set_mpattribute
          L8_1 = "BM_BLKEXC:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
          L7_1(L8_1)
          L7_1 = mp
          L7_1 = L7_1.INFECTED
          return L7_1
        end
      end
    end
  else
    L3_1 = peattributes
    L3_1 = L3_1.isexe
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.get_contextdata
      L4_1 = mp
      L4_1 = L4_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
      L3_1 = L3_1(L4_1)
      if L3_1 == true or L2_1 < 10240 then
        L3_1 = mp
        L3_1 = L3_1.IsTrustedFile
        L4_1 = false
        L3_1, L4_1 = L3_1(L4_1)
        if L3_1 == false then
          L5_1 = mp
          L5_1 = L5_1.set_mpattribute
          L6_1 = "BM_BLKEXC:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
          L5_1(L6_1)
          L5_1 = mp
          L5_1 = L5_1.INFECTED
          return L5_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
