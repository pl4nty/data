local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILENAME
L0_1 = L0_1(L1_1)
if L0_1 == "notepad.exe" then
  L0_1 = pe
  L0_1 = L0_1.get_versioninfo
  L0_1 = L0_1()
  if L0_1 ~= nil then
    L0_1 = pe
    L0_1 = L0_1.get_versioninfo
    L0_1 = L0_1()
    L0_1 = L0_1.CompanyName
    if L0_1 == "Microsoft Corporation" then
      goto lbl_22
    end
  end
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
::lbl_22::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
