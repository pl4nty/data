local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "RPF:PWS:Win32/Simda.gen!B"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.executes_from_dynamic_memory
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.changedetectionname
    L1_1 = 805306411
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
end
else
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "MpHasExpensiveLoop"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.suspicious_image_version
    if L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.checks_if_debugged_undocumented
      if not L0_1 then
        L0_1 = peattributes
        L0_1 = L0_1.pea_dynmem_APIcall
        if not L0_1 then
          goto lbl_40
        end
      end
      L0_1 = mp
      L0_1 = L0_1.SUSPICIOUS
      return L0_1
    end
  end
end
::lbl_40::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
