local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = 30
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
L2_1 = L0_1 * 10000000
if L1_1 > L2_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = L1_1.ppid
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_27
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_27::
L2_1 = MpCommon
L2_1 = L2_1.GetProcessElevationAndIntegrityLevel
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1.IntegrityLevel
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = L2_1.IntegrityLevel
    L4_1 = MpCommon
    L4_1 = L4_1.SECURITY_MANDATORY_SYSTEM_RID
    if L3_1 == L4_1 then
      goto lbl_49
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_49::
L3_1 = tonumber
L4_1 = string
L4_1 = L4_1.match
L5_1 = L1_1.ppid
L6_1 = "pid:(%w+),ProcessStart:%w+"
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 or L3_1 ~= 4 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p2
  if L5_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[1]
    L6_1 = L6_1.utf8p2
    L5_1 = L5_1(L6_1)
    L7_1 = L5_1
    L6_1 = L5_1.match
    L8_1 = "remotesrcip_([%d%.]+):"
    L6_1 = L6_1(L7_1, L8_1)
    L4_1 = L6_1
  end
end
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = nil
L6_1 = nil
L7_1 = this_sigattrlog
L7_1 = L7_1[2]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[2]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[2]
    L7_1 = L7_1.utf8p2
    if L7_1 ~= nil then
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = this_sigattrlog
      L8_1 = L8_1[2]
      L8_1 = L8_1.utf8p1
      L7_1 = L7_1(L8_1)
      L6_1 = L7_1
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = this_sigattrlog
      L8_1 = L8_1[2]
      L8_1 = L8_1.utf8p2
      L7_1 = L7_1(L8_1)
      L9_1 = L7_1
      L8_1 = L7_1.match
      L10_1 = "remoteip:([%d%.]+):"
      L8_1 = L8_1(L9_1, L10_1)
      L5_1 = L8_1
    end
  end
end
L7_1 = isnull
L8_1 = L5_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = isnull
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    goto lbl_141
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_141::
if L4_1 ~= L5_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = nil
L8_1 = nil
L9_1 = this_sigattrlog
L9_1 = L9_1[4]
L9_1 = L9_1.matched
if L9_1 then
  L9_1 = this_sigattrlog
  L9_1 = L9_1[4]
  L9_1 = L9_1.utf8p1
  if L9_1 ~= nil then
    L9_1 = this_sigattrlog
    L9_1 = L9_1[4]
    L9_1 = L9_1.utf8p2
    if L9_1 ~= nil then
      L9_1 = string
      L9_1 = L9_1.lower
      L10_1 = this_sigattrlog
      L10_1 = L10_1[4]
      L10_1 = L10_1.utf8p1
      L9_1 = L9_1(L10_1)
      L8_1 = L9_1
      L9_1 = string
      L9_1 = L9_1.lower
      L10_1 = this_sigattrlog
      L10_1 = L10_1[4]
      L10_1 = L10_1.utf8p2
      L9_1 = L9_1(L10_1)
      L11_1 = L9_1
      L10_1 = L9_1.match
      L12_1 = "remoteip:([%d%.]+):"
      L10_1 = L10_1(L11_1, L12_1)
      L7_1 = L10_1
    end
  end
end
L9_1 = isnull
L10_1 = L7_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = isnull
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if not L9_1 then
    goto lbl_192
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_192::
if L4_1 ~= L7_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
if L6_1 == L8_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = nil
L10_1 = nil
L11_1 = nil
L12_1 = nil
L13_1 = false
L14_1 = MpCommon
L14_1 = L14_1.GetBehavioralNetworkBlocksSettings
if L14_1 then
  L14_1 = pcall
  L15_1 = MpCommon
  L15_1 = L15_1.GetBehavioralNetworkBlocksSettings
  L16_1 = MpCommon
  L16_1 = L16_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
  L14_1, L15_1 = L14_1(L15_1, L16_1)
  L10_1 = L15_1
  L9_1 = L14_1
  if L9_1 and L10_1 then
    L14_1 = isnull
    L15_1 = L10_1.Exclusions
    L14_1 = L14_1(L15_1)
    if not L14_1 then
      L14_1 = L10_1.Exclusions
      if L14_1 ~= "" then
        L14_1 = split
        L15_1 = L10_1.Exclusions
        L16_1 = "|"
        L14_1 = L14_1(L15_1, L16_1)
        L15_1 = convert_to_hashtable
        L16_1 = L14_1
        L15_1 = L15_1(L16_1)
        L14_1 = L15_1
        L15_1 = isIPInExclusionList
        L16_1 = L4_1
        L17_1 = L14_1
        L18_1 = true
        L15_1 = L15_1(L16_1, L17_1, L18_1)
        L13_1 = L15_1
      end
    end
    L14_1 = isnull
    L15_1 = L10_1.AggressiveLevel
    L14_1 = L14_1(L15_1)
    if not L14_1 then
      L11_1 = L10_1.AggressiveLevel
    end
    L14_1 = isnull
    L15_1 = L10_1.State
    L14_1 = L14_1(L15_1)
    if not L14_1 then
      L12_1 = L10_1.State
    end
  end
end
if L13_1 == true then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = isnull
L15_1 = L12_1
L14_1 = L14_1(L15_1)
if not L14_1 then
  L14_1 = MpCommon
  L14_1 = L14_1.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED
  if L12_1 == L14_1 then
    goto lbl_275
  end
  L14_1 = MpCommon
  L14_1 = L14_1.MP_BEHAVIORAL_NETWORK_BLOCK_AUDIT
  if L12_1 == L14_1 then
    goto lbl_275
  end
end
L14_1 = mp
L14_1 = L14_1.CLEAN
do return L14_1 end
::lbl_275::
L14_1 = isnull
L15_1 = L11_1
L14_1 = L14_1(L15_1)
if L14_1 or L11_1 ~= 2 then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = isnull
L15_1 = ipv4ToInt
L16_1 = L4_1
L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L15_1(L16_1)
L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
if not L14_1 then
  L14_1 = ipv4IsPrivateRange
  L15_1 = L4_1
  L14_1 = L14_1(L15_1)
  L15_1 = isnull
  L16_1 = L14_1
  L15_1 = L15_1(L16_1)
  if not L15_1 then
    L15_1 = "RemoteIP="
    L16_1 = L4_1
    L17_1 = ";File1="
    L18_1 = L6_1
    L19_1 = ";File2="
    L20_1 = L8_1
    L21_1 = ";"
    L15_1 = L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1
    if L14_1 == true then
      L16_1 = bm
      L16_1 = L16_1.trigger_sig
      L17_1 = "Ransomware!RemoteGenZeroPlus.A!RemoteIpPrivate"
      L18_1 = L15_1
      L16_1(L17_1, L18_1)
      L16_1 = mp
      L16_1 = L16_1.INFECTED
      return L16_1
    else
      L16_1 = bm
      L16_1 = L16_1.trigger_sig
      L17_1 = "Ransomware!RemoteGenZeroPlus.A!RemoteIpPublic"
      L18_1 = L15_1
      L16_1(L17_1, L18_1)
      L16_1 = mp
      L16_1 = L16_1.INFECTED
      return L16_1
    end
  end
end
L14_1 = mp
L14_1 = L14_1.CLEAN
return L14_1
