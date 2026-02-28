local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p2
    end
  end
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "sqlite.dll"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "axhub.dll"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = ".ocx"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_58
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_58::
L1_1 = extractDllForRegproc
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.ContextualExpandEnvironmentVariables
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = sysio
    L2_1 = L2_1.GetFileLastWriteTime
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L3_1 = sysio
    L3_1 = L3_1.GetLastResult
    L3_1 = L3_1()
    L3_1 = L3_1.Success
    if L3_1 and L2_1 ~= 0 then
      L3_1 = L2_1 / 10000000
      L2_1 = L3_1 - 11644473600
      L3_1 = MpCommon
      L3_1 = L3_1.GetCurrentTimeT
      L3_1 = L3_1()
      if not (L2_1 > L3_1) then
        L4_1 = L3_1 - L2_1
        if not (3600 < L4_1) then
          goto lbl_103
        end
      end
      L4_1 = bm
      L4_1 = L4_1.add_related_file
      L5_1 = L1_1
      L4_1(L5_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
::lbl_103::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
