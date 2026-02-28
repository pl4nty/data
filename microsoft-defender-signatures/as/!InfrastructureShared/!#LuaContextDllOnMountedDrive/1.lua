local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSDEVICEPATH
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_FNAME
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L3_1(L4_1, L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L0_1 == nil or L1_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L0_1 == "" or L1_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.getfilesize
L4_1 = L4_1()
if L1_1 == "keyvaultfx.exe" then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\netlock\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    goto lbl_223
  end
end
if L1_1 == "netlock.exe" then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\netlock\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    goto lbl_223
  end
end
if L1_1 == "ptlite10.exe" then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\ptlite10\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    goto lbl_223
  end
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L2_1
L7_1 = "\\ptlres10"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "rufus"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L2_1
    L7_1 = "windows\\winsxs"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 and L4_1 < 11000 then
      goto lbl_223
    end
  end
  if L1_1 == "regsvr32.exe" then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L2_1
    L7_1 = "lav filters"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 then
      L6_1 = L3_1
      L5_1 = L3_1.sub
      L7_1 = -3
      L5_1 = L5_1(L6_1, L7_1)
      if L5_1 == ".ax" then
        goto lbl_223
      end
    end
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L2_1
    L7_1 = "checkver.ocx"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 and L4_1 == 306256 then
      goto lbl_223
    end
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L2_1
    L7_1 = "diswhql.dll"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 and L4_1 == 6205440 then
      goto lbl_223
    end
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L2_1
    L7_1 = "melsoft\\gx works2"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 then
      goto lbl_223
    end
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "virtualbench.exe"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L2_1
    L7_1 = "nationalinstruments"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 then
      goto lbl_223
    end
  end
  if L1_1 ~= "start.exe" then
    goto lbl_226
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L3_1
  L7_1 = "rtpkcs11ecp.dll"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L3_1
    L7_1 = "libssl-1_1.dll"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L3_1
      L7_1 = "rtengine.dll"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L3_1
        L7_1 = "libcrypto-1_1.dll"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      end
    end
  end
  if not (L5_1 and L4_1 < 3000000) then
    goto lbl_226
  end
end
::lbl_223::
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_226::
L5_1 = nil
if L1_1 ~= "rundll32.exe" and L1_1 ~= "regsvr32.exe" then
  L6_1 = L0_1
  L7_1 = "\\"
  L8_1 = L1_1
  L6_1 = L6_1 .. L7_1 .. L8_1
  L7_1 = MpCommon
  L7_1 = L7_1.GetOriginalFileName
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L5_1 = L7_1
end
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_FILE_ATTRIBUTES
L6_1 = L6_1(L7_1)
L7_1 = mp
L7_1 = L7_1.bitand
L8_1 = L6_1
L9_1 = 2
L7_1 = L7_1(L8_1, L9_1)
L9_1 = L3_1
L8_1 = L3_1.sub
L10_1 = -3
L8_1 = L8_1(L9_1, L10_1)
L9_1 = L8_1
L8_1 = L8_1.lower
L8_1 = L8_1(L9_1)
if L7_1 == 0 then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:Context/DllOnMountedDrive"
  L9_1(L10_1)
  if L1_1 == "regsvr32.exe" or L5_1 ~= nil and L5_1 == "regsvr32.exe" then
    if L8_1 ~= "dll" and L8_1 ~= "ocx" and L8_1 ~= ".ax" then
      if L1_1 ~= "regsvr32.exe" then
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:Context/VerySuspiciousMountedDriveDllRegsvrLoad"
        L9_1(L10_1)
      else
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:Context/SuspiciousMountedDriveDllRegsvrLoad"
        L9_1(L10_1)
      end
    else
      L9_1 = mp
      L9_1 = L9_1.set_mpattribute
      L10_1 = "Lua:Context/MountedDriveDllRegsvrLoad"
      L9_1(L10_1)
    end
  elseif L1_1 == "rundll32.exe" or L5_1 ~= nil and L5_1 == "rundll32.exe" then
    if L8_1 ~= "dll" and L8_1 ~= "ocx" then
      if L1_1 ~= "rundll32.exe" then
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:Context/VerySuspiciousMountedDriveDllRundllLoad"
        L9_1(L10_1)
      else
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:Context/SuspiciousMountedDriveDllRundllLoad"
        L9_1(L10_1)
      end
    else
      L9_1 = mp
      L9_1 = L9_1.set_mpattribute
      L10_1 = "Lua:Context/MountedDriveDllRundllLoad"
      L9_1(L10_1)
    end
  end
  L10_1 = L0_1
  L9_1 = L0_1.find
  L11_1 = "\\device\\cdrom"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 ~= nil then
    L9_1 = mp
    L9_1 = L9_1.set_mpattribute
    L10_1 = "Lua:Context/MaybeDllSideLoadingOnMountedDrive"
    L9_1(L10_1)
  end
else
  if L1_1 == "regsvr32.exe" or L5_1 ~= nil and L5_1 == "regsvr32.exe" then
    if L8_1 ~= "dll" and L8_1 ~= "ocx" then
      if L1_1 ~= "regsvr32.exe" then
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:Context/VerySuspiciousMountedDriveHiddenDllRegsvrLoad"
        L9_1(L10_1)
      else
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:Context/SuspiciousMountedDriveHiddenDllRegsvrLoad"
        L9_1(L10_1)
      end
    else
      L9_1 = mp
      L9_1 = L9_1.set_mpattribute
      L10_1 = "Lua:Context/MountedDriveHiddenDllRegsvrLoad"
      L9_1(L10_1)
    end
  elseif L1_1 == "rundll32.exe" or L5_1 ~= nil and L5_1 == "rundll32.exe" then
    if L8_1 ~= "dll" and L8_1 ~= "ocx" then
      if L1_1 ~= "rundll32.exe" then
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:Context/VerySuspiciousMountedDriveHiddenDllRundllLoad"
        L9_1(L10_1)
      else
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:Context/SuspiciousMountedDriveHiddenDllRundllLoad"
        L9_1(L10_1)
      end
    else
      L9_1 = mp
      L9_1 = L9_1.set_mpattribute
      L10_1 = "Lua:Context/MountedDriveHiddenDllRundllLoad"
      L9_1(L10_1)
    end
  end
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:Context/HiddenDllOnMountedDrive"
  L9_1(L10_1)
  L10_1 = L0_1
  L9_1 = L0_1.find
  L11_1 = "\\device\\cdrom"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 ~= nil then
    L9_1 = mp
    L9_1 = L9_1.set_mpattribute
    L10_1 = "Lua:Context/MaybeHiddenDllSideLoadingOnMountedDrive"
    L9_1(L10_1)
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
