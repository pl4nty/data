local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
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
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
if L2_1 == nil or L2_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "/bin/"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= 1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "/system/"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= 1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L1_1
    L5_1 = "/sbin/"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= 1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "/library/apple/"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 ~= 1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L1_1
        L5_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 ~= 1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L1_1
          L5_1 = "/usr/"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 == 1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L1_1
            L5_1 = "/usr/local/"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            L3_1 = not L3_1
            if L3_1 == 1 then
              goto lbl_112
            end
          end
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L1_1
          L5_1 = "/applications/microsoft defender.app/"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 ~= 1 then
            goto lbl_115
          end
        end
      end
    end
  end
end
::lbl_112::
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_115::
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESS_PPID
L3_1 = L3_1(L4_1)
L4_1 = L1_1
L5_1 = "/"
L6_1 = L2_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = {}
L6_1 = "launchd"
L7_1 = "launchctl"
L8_1 = "bash"
L9_1 = "zsh"
L10_1 = "wget"
L11_1 = "curl"
L12_1 = "xattr"
L13_1 = "crontab"
L14_1 = "configd"
L15_1 = "syslog"
L16_1 = "xpcproxy"
L17_1 = "discord"
L18_1 = "whoami"
L19_1 = "security"
L20_1 = "swift"
L21_1 = "rsync"
L22_1 = "hdiutil"
L23_1 = "xpcservice"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L5_1[6] = L11_1
L5_1[7] = L12_1
L5_1[8] = L13_1
L5_1[9] = L14_1
L5_1[10] = L15_1
L5_1[11] = L16_1
L5_1[12] = L17_1
L5_1[13] = L18_1
L5_1[14] = L19_1
L5_1[15] = L20_1
L5_1[16] = L21_1
L5_1[17] = L22_1
L5_1[18] = L23_1
L7_1 = L2_1
L6_1 = L2_1.match
L8_1 = "(.+)%.[^.]*$"
L6_1 = L6_1(L7_1, L8_1)
L7_1 = pairs
L8_1 = L5_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  if L2_1 == L11_1 or L6_1 == L11_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "BM_MacMasquerading"
    L12_1(L13_1)
    if L3_1 then
      L12_1 = MpCommon
      L12_1 = L12_1.BmTriggerSig
      L13_1 = L3_1
      L14_1 = "BM_MacPYMasquerading"
      L15_1 = L4_1
      L12_1(L13_1, L14_1, L15_1)
      L12_1 = TrackPidAndTechnique
      L13_1 = L3_1
      L14_1 = "T1036.005"
      L15_1 = "DefenseEvasion_Masquerading_ExecWitExactLegitName"
      L12_1(L13_1, L14_1, L15_1)
    end
    L12_1 = mp
    L12_1 = L12_1.INFECTED
    return L12_1
  end
  L13_1 = L2_1
  L12_1 = L2_1.gsub
  L14_1 = "%W"
  L15_1 = ""
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  L14_1 = L6_1
  L13_1 = L6_1.gsub
  L15_1 = "%W"
  L16_1 = ""
  L13_1 = L13_1(L14_1, L15_1, L16_1)
  if L12_1 == L11_1 or L13_1 == L11_1 then
    L14_1 = mp
    L14_1 = L14_1.set_mpattribute
    L15_1 = "BM_MacMasquerading"
    L14_1(L15_1)
    if L3_1 then
      L14_1 = MpCommon
      L14_1 = L14_1.BmTriggerSig
      L15_1 = L3_1
      L16_1 = "BM_MacPYMasquerading"
      L17_1 = L4_1
      L14_1(L15_1, L16_1, L17_1)
      L14_1 = TrackPidAndTechnique
      L15_1 = L3_1
      L16_1 = "T1036.005"
      L17_1 = "DefenseEvasion_Masquerading_ExecWitExactLegitName"
      L14_1(L15_1, L16_1, L17_1)
    end
    L14_1 = mp
    L14_1 = L14_1.INFECTED
    return L14_1
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
