local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L5_1 = this_sigattrlog
L5_1 = L5_1[6]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[6]
  L5_1 = L5_1.utf8p2
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[6]
    L5_1 = L5_1.utf8p2
    L6_1 = L5_1
    L5_1 = L5_1.lower
    L5_1 = L5_1(L6_1)
    L0_1 = L5_1
    L5_1 = this_sigattrlog
    L5_1 = L5_1[6]
    L3_1 = L5_1.ppid
end
else
  L5_1 = this_sigattrlog
  L5_1 = L5_1[7]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[7]
    L5_1 = L5_1.utf8p2
    if L5_1 ~= nil then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[7]
      L5_1 = L5_1.utf8p2
      L6_1 = L5_1
      L5_1 = L5_1.lower
      L5_1 = L5_1(L6_1)
      L0_1 = L5_1
      L5_1 = this_sigattrlog
      L5_1 = L5_1[7]
      L3_1 = L5_1.ppid
    end
  end
end
L5_1 = this_sigattrlog
L5_1 = L5_1[4]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[4]
  L5_1 = L5_1.utf8p1
  if L5_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = this_sigattrlog
    L6_1 = L6_1[4]
    L6_1 = L6_1.utf8p1
    L7_1 = "\\([^\\]+)$"
    L5_1 = L5_1(L6_1, L7_1)
    L1_1 = L5_1
  end
end
L5_1 = contains
L6_1 = L0_1
L7_1 = L1_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if not L0_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = false
L6_1 = mp
L6_1 = L6_1.GetParentProcInfo
L7_1 = L3_1
L6_1 = L6_1(L7_1)
if L6_1 ~= nil then
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L6_1.image_path
  L7_1 = L7_1(L8_1)
  L4_1 = L7_1
end
if not L4_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = {}
L8_1 = "certutil.exe"
L9_1 = "mshta.exe"
L7_1[1] = L8_1
L7_1[2] = L9_1
L8_1 = contains
L9_1 = L4_1
L10_1 = L7_1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L5_1 = true
end
L8_1 = {}
L9_1 = "winword.exe"
L10_1 = "excel.exe"
L11_1 = "powerpnt.exe"
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L9_1 = contains
L10_1 = L4_1
L11_1 = L8_1
L9_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L5_1 = true
end
L9_1 = extractDllForRegproc
L10_1 = L0_1
L9_1 = L9_1(L10_1)
L2_1 = L9_1
if L2_1 then
  L9_1 = mp
  L9_1 = L9_1.ContextualExpandEnvironmentVariables
  L10_1 = L2_1
  L9_1 = L9_1(L10_1)
  L2_1 = L9_1
  L9_1 = sysio
  L9_1 = L9_1.IsFileExists
  L10_1 = L2_1
  L9_1 = L9_1(L10_1)
  if L9_1 then
    L9_1 = sysio
    L9_1 = L9_1.GetFileLastWriteTime
    L10_1 = L2_1
    L9_1 = L9_1(L10_1)
    L10_1 = sysio
    L10_1 = L10_1.GetLastResult
    L10_1 = L10_1()
    L10_1 = L10_1.Success
    if L10_1 and L9_1 ~= 0 then
      L10_1 = L9_1 / 10000000
      L9_1 = L10_1 - 11644473600
      L10_1 = MpCommon
      L10_1 = L10_1.GetCurrentTimeT
      L10_1 = L10_1()
      if not (L9_1 > L10_1) then
        L11_1 = L10_1 - L9_1
        if not (3600 < L11_1) or L5_1 ~= true then
          goto lbl_158
        end
      end
      L11_1 = bm
      L11_1 = L11_1.add_related_file
      L12_1 = L2_1
      L11_1(L12_1)
      goto lbl_161
      ::lbl_158::
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
  end
end
::lbl_161::
if L5_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
