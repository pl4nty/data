local L0_1, L1_1, L2_1, L3_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 ~= 6 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.SizeOfRawData
if L0_1 == 0 then
  L0_1 = pesecs
  L0_1 = L0_1[2]
  L0_1 = L0_1.SizeOfRawData
  if L0_1 == 0 then
    L0_1 = pesecs
    L0_1 = L0_1[3]
    L0_1 = L0_1.SizeOfRawData
    if L0_1 == 0 then
      L0_1 = pesecs
      L0_1 = L0_1[4]
      L0_1 = L0_1.SizeOfRawData
      if L0_1 == 0 then
        goto lbl_31
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_31::
L0_1 = pesecs
L0_1 = L0_1[5]
L0_1 = L0_1.SizeOfRawData
if L0_1 < 2097151 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.Name
if L0_1 ~= ".text" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L0_1 = L0_1[2]
L0_1 = L0_1.Name
if L0_1 ~= ".rdata" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L0_1 = L0_1[3]
L0_1 = L0_1.Name
if L0_1 ~= ".data" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.match
L1_1 = pesecs
L1_1 = L1_1[4]
L1_1 = L1_1.Name
L2_1 = "^%.%a%a%a%a?%a?0$"
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == nil then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.match
L1_1 = pesecs
L1_1 = L1_1[5]
L1_1 = L1_1.Name
L2_1 = "^%.%a%a%a%a?%a?1$"
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == nil then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L0_1 = L0_1[6]
L0_1 = L0_1.Name
if L0_1 ~= ".rsrc" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.dt_error_heur_exit_criteria
if L0_1 then
  L0_1 = pe
  L0_1 = L0_1.get_versioninfo
  L0_1 = L0_1()
  if L0_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1.LegalCopyright
    L3_1 = "Copyright http://simple%-files.com %(C%)"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 ~= nil then
      L1_1 = mp
      L1_1 = L1_1.set_mpattribute
      L2_1 = "Program:Win32/SimpleFileInstaller"
      L1_1(L2_1)
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
