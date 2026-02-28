local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = type
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == "string" then
    goto lbl_14
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_14::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and L0_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
  if L0_1 == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
    L1_1 = MpCommon
    L1_1 = L1_1.IsSampled
    L2_1 = 100
    L3_1 = false
    L4_1 = true
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == true then
      goto lbl_37
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_37::
L1_1 = ""
L2_1 = ""
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L1_1 = L3_1.utf8p1
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L2_1 = L3_1.utf8p2
  if L1_1 == nil or L1_1 == "" or L2_1 == nil or L2_1 == "" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.ContextualExpandEnvironmentVariables
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L1_1 = L3_1
  L3_1 = mp
  L3_1 = L3_1.ContextualExpandEnvironmentVariables
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  if L1_1 == nil or L1_1 == "" or L2_1 == nil or L2_1 == "" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = MpCommon
  L3_1 = L3_1.PathToWin32Path
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L1_1 = L3_1
  L3_1 = MpCommon
  L3_1 = L3_1.PathToWin32Path
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  if L1_1 == nil or L1_1 == "" or L2_1 == nil or L2_1 == "" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L1_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  if L1_1 == nil or L1_1 == "" or L2_1 == nil or L2_1 == "" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L1_1 = L3_1.utf8p2
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L2_1 = L3_1.utf8p1
    if L1_1 == nil or L1_1 == "" or L2_1 == nil or L2_1 == "" then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = mp
    L3_1 = L3_1.ContextualExpandEnvironmentVariables
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
    L3_1 = mp
    L3_1 = L3_1.ContextualExpandEnvironmentVariables
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    if L1_1 == nil or L1_1 == "" or L2_1 == nil or L2_1 == "" then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    if L1_1 == nil or L1_1 == "" or L2_1 == nil or L2_1 == "" then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    if L1_1 == nil or L1_1 == "" or L2_1 == nil or L2_1 == "" then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  else
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = ""
L4_1 = ""
L5_1 = ""
L6_1 = string
L6_1 = L6_1.match
L7_1 = L1_1
L8_1 = "(%.[^%.]+)$"
L6_1 = L6_1(L7_1, L8_1)
L3_1 = L6_1
if L3_1 ~= nil and L3_1 ~= "" then
  L6_1 = IsBasFileEncryptExt
  L7_1 = L3_1
  L6_1 = L6_1(L7_1)
  if L6_1 == true then
    L5_1 = L1_1
end
else
  L6_1 = string
  L6_1 = L6_1.match
  L7_1 = L2_1
  L8_1 = "(%.[^%.]+)$"
  L6_1 = L6_1(L7_1, L8_1)
  L4_1 = L6_1
  if L4_1 ~= nil and L4_1 ~= "" then
    L6_1 = IsBasFileEncryptExt
    L7_1 = L4_1
    L6_1 = L6_1(L7_1)
    if L6_1 == true then
      L5_1 = L2_1
  end
  else
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L6_1 = bm
L6_1 = L6_1.get_current_process_startup_info
L6_1 = L6_1()
if L6_1 ~= nil then
  L7_1 = type
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 == "table" then
    L7_1 = L6_1.ppid
    if L7_1 ~= nil then
      L7_1 = L6_1.ppid
      if L7_1 ~= "" then
        goto lbl_273
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_273::
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1.ppid
L7_1 = L7_1(L8_1)
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = string
L8_1 = L8_1.match
L9_1 = L7_1
L10_1 = "pid:(%w+),processstart.+"
L8_1 = L8_1(L9_1, L10_1)
L7_1 = L8_1
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = tonumber
L9_1 = L7_1
L8_1 = L8_1(L9_1)
L7_1 = L8_1
if L7_1 == nil or L7_1 == 4 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = bm
L8_1 = L8_1.get_imagepath
L8_1 = L8_1()
if L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = MpCommon
L9_1 = L9_1.PathToWin32Path
L10_1 = L8_1
L9_1 = L9_1(L10_1)
L8_1 = L9_1
if L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = string
L9_1 = L9_1.lower
L10_1 = L8_1
L9_1 = L9_1(L10_1)
L8_1 = L9_1
L9_1 = string
L9_1 = L9_1.lower
L10_1 = L6_1.ppid
L11_1 = "\\"
L12_1 = L8_1
L10_1 = L10_1 .. L11_1 .. L12_1
L9_1 = L9_1(L10_1)
L10_1 = tonumber
L11_1 = GetRqValueByKeyNS
L12_1 = "BAS_SB_Coverage"
L13_1 = "BAS_SB_EncryptProcs_Tel"
L14_1 = L9_1
L15_1 = "\\OriginalNonExecFiles"
L14_1 = L14_1 .. L15_1
L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L11_1(L12_1, L13_1, L14_1)
L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
if not L10_1 then
  L10_1 = 0
end
L11_1 = tonumber
L12_1 = GetRqValueByKeyNS
L13_1 = "BAS_SB_Coverage"
L14_1 = "BAS_SB_EncryptProcs_Tel"
L15_1 = L9_1
L16_1 = "\\RelatedNonExecFiles"
L15_1 = L15_1 .. L16_1
L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L12_1(L13_1, L14_1, L15_1)
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
if not L11_1 then
  L11_1 = 0
end
L12_1 = 0
L13_1 = tonumber
L14_1 = GetRqValueByKeyNS
L15_1 = "BAS_SB_Coverage"
L16_1 = "BAS_SB_EncryptProcs_Tel"
L17_1 = L9_1
L18_1 = "\\RestNonExecFiles"
L17_1 = L17_1 .. L18_1
L14_1, L15_1, L16_1, L17_1, L18_1 = L14_1(L15_1, L16_1, L17_1)
L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1, L18_1)
if not L13_1 then
  L13_1 = 0
end
L14_1 = GetRqValueByKeyNS
L15_1 = "BAS_SB_Coverage"
L16_1 = "BAS_SB_OriginalNonExecFiles_Tel"
L17_1 = L5_1
L14_1 = L14_1(L15_1, L16_1, L17_1)
if L14_1 then
  L14_1 = UpdateRqIntValueByKeyNS
  L15_1 = "BAS_SB_Coverage"
  L16_1 = "BAS_SB_EncryptProcs_Tel"
  L17_1 = L9_1
  L18_1 = "\\OriginalNonExecFiles"
  L17_1 = L17_1 .. L18_1
  L18_1 = 1
  L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
  L10_1 = L14_1
else
  L14_1 = GetRqValueByKeyNS
  L15_1 = "BAS_SB_Coverage"
  L16_1 = "BAS_SB_RelatedNonExecFiles_Tel"
  L17_1 = L5_1
  L14_1 = L14_1(L15_1, L16_1, L17_1)
  if L14_1 then
    L14_1 = UpdateRqIntValueByKeyNS
    L15_1 = "BAS_SB_Coverage"
    L16_1 = "BAS_SB_EncryptProcs_Tel"
    L17_1 = L9_1
    L18_1 = "\\RelatedNonExecFiles"
    L17_1 = L17_1 .. L18_1
    L18_1 = 1
    L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
    L11_1 = L14_1
  else
    L14_1 = GetRqValueByKeyNS
    L15_1 = "BAS_SB_Coverage"
    L16_1 = "BAS_SB_EncryptSmbNonExecFiles_Tel"
    L17_1 = L5_1
    L14_1 = L14_1(L15_1, L16_1, L17_1)
    if L14_1 then
      L12_1 = 1
    else
      L14_1 = GetRqValueByKeyNS
      L15_1 = "BAS_SB_Coverage"
      L16_1 = "BAS_SB_EncryptRestNonExecFiles_Tel"
      L17_1 = L5_1
      L14_1 = L14_1(L15_1, L16_1, L17_1)
      if L14_1 then
        L14_1 = UpdateRqIntValueByKeyNS
        L15_1 = "BAS_SB_Coverage"
        L16_1 = "BAS_SB_EncryptProcs_Tel"
        L17_1 = L9_1
        L18_1 = "\\RestNonExecFiles"
        L17_1 = L17_1 .. L18_1
        L18_1 = 1
        L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
        L13_1 = L14_1
      else
        L14_1 = GetRqValueByKeyNS
        L15_1 = "BAS_SB_Coverage"
        L16_1 = "BAS_SB_OriginalProcs_Tel"
        L17_1 = L9_1
        L14_1 = L14_1(L15_1, L16_1, L17_1)
        if not L14_1 then
          L14_1 = GetRqValueByKeyNS
          L15_1 = "BAS_SB_Coverage"
          L16_1 = "BAS_SB_RelatedProcs_Tel"
          L17_1 = L9_1
          L14_1 = L14_1(L15_1, L16_1, L17_1)
          if not L14_1 then
            goto lbl_461
          end
        end
        L14_1 = UpdateRqStrValueByKeyNS
        L15_1 = "BAS_SB_Coverage"
        L16_1 = "BAS_SB_RelatedNonExecFiles_Tel"
        L17_1 = L5_1
        L18_1 = "1"
        L14_1(L15_1, L16_1, L17_1, L18_1)
        L14_1 = UpdateRqIntValueByKeyNS
        L15_1 = "BAS_SB_Coverage"
        L16_1 = "BAS_SB_EncryptProcs_Tel"
        L17_1 = L9_1
        L18_1 = "\\RelatedNonExecFiles"
        L17_1 = L17_1 .. L18_1
        L18_1 = 1
        L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
        L11_1 = L14_1
        goto lbl_476
        ::lbl_461::
        L14_1 = UpdateRqStrValueByKeyNS
        L15_1 = "BAS_SB_Coverage"
        L16_1 = "BAS_SB_EncryptRestNonExecFiles_Tel"
        L17_1 = L5_1
        L18_1 = "1"
        L14_1(L15_1, L16_1, L17_1, L18_1)
        L14_1 = UpdateRqIntValueByKeyNS
        L15_1 = "BAS_SB_Coverage"
        L16_1 = "BAS_SB_EncryptProcs_Tel"
        L17_1 = L9_1
        L18_1 = "\\RestNonExecFiles"
        L17_1 = L17_1 .. L18_1
        L18_1 = 1
        L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
        L13_1 = L14_1
      end
    end
  end
end
::lbl_476::
if not (2 <= L10_1) and not (3 <= L11_1) and not (4 <= L12_1) then
  L14_1 = L10_1 + L11_1
  if not (4 <= L14_1) then
    L14_1 = L10_1 + L11_1
    L14_1 = L14_1 + L12_1
    if not (6 <= L14_1) then
      L14_1 = L10_1 + L11_1
      L14_1 = L14_1 + L12_1
      L14_1 = L14_1 + L13_1
      if not (8 <= L14_1) then
        goto lbl_497
      end
    end
  end
end
L14_1 = mp
L14_1 = L14_1.INFECTED
do return L14_1 end
::lbl_497::
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
