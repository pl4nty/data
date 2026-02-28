local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 5) then
    goto lbl_31
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_31::
L2_1 = IsExcludedByImagePathMacOS
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "/bin/"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "/system/"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= 1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "/sbin/"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= 1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "/library/apple/"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= 1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 ~= 1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "/usr/"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 == 1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L1_1
            L4_1 = "/usr/local/"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            L2_1 = not L2_1
            if L2_1 == 1 then
              goto lbl_112
            end
          end
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "/applications/microsoft defender.app/"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 ~= 1 then
            goto lbl_115
          end
        end
      end
    end
  end
end
::lbl_112::
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_115::
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "/contents/macos/"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "(.-)/contents"
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = ".app"
  L7_1 = -4
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "BM_ScriptPartOfApp"
    L4_1(L5_1)
    if L2_1 then
      L4_1 = MpCommon
      L4_1 = L4_1.BmTriggerSig
      L5_1 = L2_1
      L6_1 = "BM_ScriptPartOfApp"
      L7_1 = L1_1
      L4_1(L5_1, L6_1, L7_1)
    end
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  else
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "BM_ScriptPartOfBundleWithoutAppExt"
    L4_1(L5_1)
    if L2_1 then
      L4_1 = MpCommon
      L4_1 = L4_1.BmTriggerSig
      L5_1 = L2_1
      L6_1 = "BM_ScriptPartOfBundleWithoutAppExt"
      L7_1 = L1_1
      L4_1(L5_1, L6_1, L7_1)
      L4_1 = TrackPidAndTechnique
      L5_1 = L2_1
      L6_1 = "T1036.005"
      L7_1 = "DefenseEvasion_Masquerading_AppBundle"
      L4_1(L5_1, L6_1, L7_1)
    end
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
