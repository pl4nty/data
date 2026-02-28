local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetCertificateInfo
L1_1 = L1_1()
L2_1 = #L1_1
if 0 < L2_1 and L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "->(macho-unibin-"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.gsub
  L5_1 = "%->%(macho%-unibin%-.*"
  L6_1 = ""
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L2_1 = L3_1
end
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 5) then
    goto lbl_56
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_56::
L3_1 = IsExcludedByImagePathMacOS
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
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
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "->(MachO-UniBin-"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L5_1 = L3_1
  L4_1 = L3_1.gsub
  L6_1 = "%->%(MachO%-UniBin%-.*"
  L7_1 = ""
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  L3_1 = L4_1
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.find
L6_1 = L2_1
L7_1 = "/contents/macos/"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = string
  L5_1 = L5_1.match
  L6_1 = L2_1
  L7_1 = "(.-)/contents"
  L5_1 = L5_1(L6_1, L7_1)
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = ".app"
  L9_1 = -4
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "BM_MachoPartOfApp"
    L6_1(L7_1)
    if L4_1 then
      L6_1 = MpCommon
      L6_1 = L6_1.BmTriggerSig
      L7_1 = L4_1
      L8_1 = "BM_MachoPartOfApp"
      L9_1 = L2_1
      L6_1(L7_1, L8_1, L9_1)
    end
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  else
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "BM_MachoPartOfBundleWithoutAppExt"
    L6_1(L7_1)
    if L4_1 then
      L6_1 = MpCommon
      L6_1 = L6_1.BmTriggerSig
      L7_1 = L4_1
      L8_1 = "BM_MachoPartOfBundleWithoutAppExt"
      L9_1 = L3_1
      L6_1(L7_1, L8_1, L9_1)
      L6_1 = TrackPidAndTechnique
      L7_1 = L4_1
      L8_1 = "T1036.005"
      L9_1 = "DefenseEvasion_Masquerading_AppBundle"
      L6_1(L7_1, L8_1, L9_1)
    end
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
