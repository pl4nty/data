local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 ~= nil then
  L1_1 = StringEndsWith
  L2_1 = L0_1
  L3_1 = ".vbs"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = StringEndsWith
    L2_1 = L0_1
    L3_1 = ".js"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      goto lbl_68
    end
  end
  L1_1 = mp
  L1_1 = L1_1.ContextualExpandEnvironmentVariables
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = IsKeyInRollingQueue
  L3_1 = "CC_filelist"
  L4_1 = L1_1
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = sysio
    L2_1 = L2_1.IsFileExists
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
::lbl_68::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
