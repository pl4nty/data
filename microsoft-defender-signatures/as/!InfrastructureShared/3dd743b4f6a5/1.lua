local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.GetImagePathFromPid
L2_1 = L0_1
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
L4_1 = "\\([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L2_1 ~= "schtasks.exe" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L3_1 = L3_1()
if L3_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L3_1.image_path
  L5_1 = L5_1(L6_1)
  L6_1 = "python"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = IsProcNameInParentProcessTree
    L5_1 = "cmdhstr"
    L6_1 = "ai_exec_server.exe"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = versioning
      L4_1 = L4_1.GetOrgID
      L4_1 = L4_1()
      if L4_1 == nil or L4_1 == "" then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L5_1 = string
      L5_1 = L5_1.lower
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      L4_1 = L5_1
      if L4_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and L4_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and L4_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
        if L4_1 == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
          goto lbl_102
        end
        L5_1 = versioning
        L5_1 = L5_1.IsSampled
        L6_1 = 2000
        L7_1 = false
        L8_1 = true
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if L5_1 ~= true then
          goto lbl_102
        end
      end
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      do return L5_1 end
      ::lbl_102::
      if L4_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
        L5_1 = versioning
        L5_1 = L5_1.IsSampled
        L6_1 = 60000
        L7_1 = false
        L8_1 = true
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if L5_1 == true then
          L5_1 = mp
          L5_1 = L5_1.LOWFI
          return L5_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
