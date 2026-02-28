local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = type
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == "string" then
    goto lbl_26
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_26::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == "64eacc49-6a31-42c6-9b39-c3d9148e65f4" or L0_1 == "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if L0_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1 = L1_1(L2_1)
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
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "(%.[^%.]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsBasFileEncryptExt
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == false then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
else
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "MpDisableMOACSyncInsert"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "MpDisableCaching"
  L3_1(L4_1)
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
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
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
L4_1 = nil
L5_1 = false
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_PROCESS_ID
L6_1 = L6_1(L7_1)
if L6_1 == 4 then
  L6_1 = mp
  L6_1 = L6_1.get_contextdata
  L7_1 = mp
  L7_1 = L7_1.CONTEXT_DATA_REMOTE_SESSION_IP
  L6_1 = L6_1(L7_1)
  L7_1 = mp
  L7_1 = L7_1.get_contextdata
  L8_1 = mp
  L8_1 = L8_1.CONTEXT_DATA_REMOTE_SESSION_USERNAME
  L7_1 = L7_1(L8_1)
  if L6_1 == nil or L6_1 == "" or L7_1 == nil or L7_1 == "" then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = L6_1
  L10_1 = "\\"
  L11_1 = L7_1
  L9_1 = L9_1 .. L10_1 .. L11_1
  L8_1 = L8_1(L9_1)
  L4_1 = L8_1
  L5_1 = true
else
  L6_1 = mp
  L6_1 = L6_1.get_contextdata
  L7_1 = mp
  L7_1 = L7_1.CONTEXT_DATA_PROCESS_PPID
  L6_1 = L6_1(L7_1)
  if L6_1 == nil or L6_1 == "" then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = mp
  L7_1 = L7_1.get_contextdata
  L8_1 = mp
  L8_1 = L8_1.CONTEXT_DATA_PROCESSNAME
  L7_1 = L7_1(L8_1)
  if L7_1 == nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = mp
  L8_1 = L8_1.get_contextdata
  L9_1 = mp
  L9_1 = L9_1.CONTEXT_DATA_PROCESSDEVICEPATH
  L8_1 = L8_1(L9_1)
  if L8_1 == nil or L8_1 == "" then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = MpCommon
  L9_1 = L9_1.PathToWin32Path
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 == nil then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = L9_1
  L12_1 = "\\"
  L13_1 = L7_1
  L11_1 = L11_1 .. L12_1 .. L13_1
  L10_1 = L10_1(L11_1)
  L11_1 = string
  L11_1 = L11_1.lower
  L12_1 = L6_1
  L13_1 = "\\"
  L14_1 = L10_1
  L12_1 = L12_1 .. L13_1 .. L14_1
  L11_1 = L11_1(L12_1)
  L4_1 = L11_1
end
L6_1 = tonumber
L7_1 = GetRqValueByKeyNS
L8_1 = "BAS_SB_Coverage"
L9_1 = "BAS_SB_EncryptProcs_Tel"
L10_1 = L4_1
L11_1 = "\\OriginalNonExecFiles"
L10_1 = L10_1 .. L11_1
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L7_1(L8_1, L9_1, L10_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if not L6_1 then
  L6_1 = 0
end
L7_1 = tonumber
L8_1 = GetRqValueByKeyNS
L9_1 = "BAS_SB_Coverage"
L10_1 = "BAS_SB_EncryptProcs_Tel"
L11_1 = L4_1
L12_1 = "\\RelatedNonExecFiles"
L11_1 = L11_1 .. L12_1
L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L8_1(L9_1, L10_1, L11_1)
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if not L7_1 then
  L7_1 = 0
end
L8_1 = tonumber
L9_1 = GetRqValueByKeyNS
L10_1 = "BAS_SB_Coverage"
L11_1 = "BAS_SB_EncryptProcs_Tel"
L12_1 = L4_1
L13_1 = "\\SmbNonExecFiles"
L12_1 = L12_1 .. L13_1
L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L9_1(L10_1, L11_1, L12_1)
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if not L8_1 then
  L8_1 = 0
end
L9_1 = tonumber
L10_1 = GetRqValueByKeyNS
L11_1 = "BAS_SB_Coverage"
L12_1 = "BAS_SB_EncryptProcs_Tel"
L13_1 = L4_1
L14_1 = "\\RestNonExecFiles"
L13_1 = L13_1 .. L14_1
L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1(L11_1, L12_1, L13_1)
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
if not L9_1 then
  L9_1 = 0
end
L10_1 = GetRqValueByKeyNS
L11_1 = "BAS_SB_Coverage"
L12_1 = "BAS_SB_OriginalNonExecFiles_Tel"
L13_1 = L3_1
L10_1 = L10_1(L11_1, L12_1, L13_1)
if L10_1 then
  L10_1 = UpdateRqIntValueByKeyNS
  L11_1 = "BAS_SB_Coverage"
  L12_1 = "BAS_SB_EncryptProcs_Tel"
  L13_1 = L4_1
  L14_1 = "\\OriginalNonExecFiles"
  L13_1 = L13_1 .. L14_1
  L14_1 = 1
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  L6_1 = L10_1
else
  L10_1 = GetRqValueByKeyNS
  L11_1 = "BAS_SB_Coverage"
  L12_1 = "BAS_SB_RelatedNonExecFiles_Tel"
  L13_1 = L3_1
  L10_1 = L10_1(L11_1, L12_1, L13_1)
  if L10_1 then
    L10_1 = UpdateRqIntValueByKeyNS
    L11_1 = "BAS_SB_Coverage"
    L12_1 = "BAS_SB_EncryptProcs_Tel"
    L13_1 = L4_1
    L14_1 = "\\RelatedNonExecFiles"
    L13_1 = L13_1 .. L14_1
    L14_1 = 1
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    L7_1 = L10_1
  else
    L10_1 = GetRqValueByKeyNS
    L11_1 = "BAS_SB_Coverage"
    L12_1 = "BAS_SB_EncryptSmbNonExecFiles_Tel"
    L13_1 = L3_1
    L10_1 = L10_1(L11_1, L12_1, L13_1)
    if L10_1 then
      L10_1 = UpdateRqIntValueByKeyNS
      L11_1 = "BAS_SB_Coverage"
      L12_1 = "BAS_SB_EncryptProcs_Tel"
      L13_1 = L4_1
      L14_1 = "\\SmbNonExecFiles"
      L13_1 = L13_1 .. L14_1
      L14_1 = 1
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      L8_1 = L10_1
    else
      L10_1 = GetRqValueByKeyNS
      L11_1 = "BAS_SB_Coverage"
      L12_1 = "BAS_SB_EncryptRestNonExecFiles_Tel"
      L13_1 = L3_1
      L10_1 = L10_1(L11_1, L12_1, L13_1)
      if L10_1 then
        L10_1 = UpdateRqIntValueByKeyNS
        L11_1 = "BAS_SB_Coverage"
        L12_1 = "BAS_SB_EncryptProcs_Tel"
        L13_1 = L4_1
        L14_1 = "\\RestNonExecFiles"
        L13_1 = L13_1 .. L14_1
        L14_1 = 1
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        L9_1 = L10_1
      elseif L5_1 then
        L10_1 = UpdateRqStrValueByKeyNS
        L11_1 = "BAS_SB_Coverage"
        L12_1 = "BAS_SB_EncryptSmbNonExecFiles_Tel"
        L13_1 = L3_1
        L14_1 = "1"
        L10_1(L11_1, L12_1, L13_1, L14_1)
        L10_1 = UpdateRqIntValueByKeyNS
        L11_1 = "BAS_SB_Coverage"
        L12_1 = "BAS_SB_EncryptProcs_Tel"
        L13_1 = L4_1
        L14_1 = "\\SmbNonExecFiles"
        L13_1 = L13_1 .. L14_1
        L14_1 = 1
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        L8_1 = L10_1
      else
        L10_1 = GetRqValueByKeyNS
        L11_1 = "BAS_SB_Coverage"
        L12_1 = "BAS_SB_OriginalProcs_Tel"
        L13_1 = L4_1
        L10_1 = L10_1(L11_1, L12_1, L13_1)
        if not L10_1 then
          L10_1 = GetRqValueByKeyNS
          L11_1 = "BAS_SB_Coverage"
          L12_1 = "BAS_SB_RelatedProcs_Tel"
          L13_1 = L4_1
          L10_1 = L10_1(L11_1, L12_1, L13_1)
          if not L10_1 then
            goto lbl_380
          end
        end
        L10_1 = UpdateRqStrValueByKeyNS
        L11_1 = "BAS_SB_Coverage"
        L12_1 = "BAS_SB_RelatedNonExecFiles_Tel"
        L13_1 = L3_1
        L14_1 = "1"
        L10_1(L11_1, L12_1, L13_1, L14_1)
        L10_1 = UpdateRqIntValueByKeyNS
        L11_1 = "BAS_SB_Coverage"
        L12_1 = "BAS_SB_EncryptProcs_Tel"
        L13_1 = L4_1
        L14_1 = "\\RelatedNonExecFiles"
        L13_1 = L13_1 .. L14_1
        L14_1 = 1
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        L7_1 = L10_1
        goto lbl_395
        ::lbl_380::
        L10_1 = UpdateRqStrValueByKeyNS
        L11_1 = "BAS_SB_Coverage"
        L12_1 = "BAS_SB_EncryptRestNonExecFiles_Tel"
        L13_1 = L3_1
        L14_1 = "1"
        L10_1(L11_1, L12_1, L13_1, L14_1)
        L10_1 = UpdateRqIntValueByKeyNS
        L11_1 = "BAS_SB_Coverage"
        L12_1 = "BAS_SB_EncryptProcs_Tel"
        L13_1 = L4_1
        L14_1 = "\\RestNonExecFiles"
        L13_1 = L13_1 .. L14_1
        L14_1 = 1
        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
        L9_1 = L10_1
      end
    end
  end
end
::lbl_395::
if not (2 <= L6_1) then
  L10_1 = L6_1 + L7_1
  if not (3 <= L10_1) then
    L10_1 = L6_1 + L7_1
    L10_1 = L10_1 + L8_1
    L10_1 = L10_1 + L9_1
    if not (4 <= L10_1) then
      goto lbl_418
    end
  end
end
L10_1 = MpCommon
L10_1 = L10_1.BmTriggerSig
L11_1 = mp
L11_1 = L11_1.get_contextdata
L12_1 = mp
L12_1 = L12_1.CONTEXT_DATA_PROCESS_PPID
L11_1 = L11_1(L12_1)
L12_1 = "BAS_BaseFileEncryptProcTel"
L13_1 = L3_1
L10_1(L11_1, L12_1, L13_1)
L10_1 = mp
L10_1 = L10_1.INFECTED
do return L10_1 end
::lbl_418::
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
