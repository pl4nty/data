local L0_1, L1_1, L2_1
L0_1 = 0
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Invoke-CheckLocalAdminAccess"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "TEL:SCPT_LCSuspiPSPattern68"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_15
  end
end
L0_1 = L0_1 + 1
::lbl_15::
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Invoke-ThreadedFunction"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "TEL:SCPT_LCSuspiPSPattern169"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_28
  end
end
L0_1 = L0_1 + 1
::lbl_28::
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Find-LocalAdminAccess"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "TEL:SCPT_LCSuspiPSPattern24"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_41
  end
end
L0_1 = L0_1 + 1
::lbl_41::
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Get-ExploitableSystem"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "TEL:SCPT_LCSuspiPSPattern209"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_54
  end
end
L0_1 = L0_1 + 1
::lbl_54::
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PowerShell/Invoke-ThreadedFunction"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "TEL:SCPT_LCSuspiPSPattern169"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_67
  end
end
L0_1 = L0_1 + 1
::lbl_67::
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "TEL:SCPT_LCSuspiPSPattern150"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "TEL:SCPT_LCSuspiPSPattern45"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT_HCSuspiPSPattern"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "TEL:SCPT_LCSuspiPSPattern143"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
if 4 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
