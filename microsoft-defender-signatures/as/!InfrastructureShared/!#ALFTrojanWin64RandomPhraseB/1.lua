local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L3_1 = L0_1
L2_1 = L0_1.lower
L2_1 = L2_1(L3_1)
L3_1 = "keepas"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L3_1 = L0_1
  L2_1 = L0_1.lower
  L2_1 = L2_1(L3_1)
  L3_1 = "betterjpeg"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L3_1 = L0_1
    L2_1 = L0_1.lower
    L2_1 = L2_1(L3_1)
    L3_1 = "xiyou"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L3_1 = L0_1
      L2_1 = L0_1.lower
      L2_1 = L2_1(L3_1)
      L3_1 = "ddnet"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L3_1 = L0_1
        L2_1 = L0_1.lower
        L2_1 = L2_1(L3_1)
        L3_1 = "webissues"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L3_1 = L0_1
          L2_1 = L0_1.lower
          L2_1 = L2_1(L3_1)
          L3_1 = "\\program files"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            goto lbl_72
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_72::
L1_1 = pe
L1_1 = L1_1.get_versioninfo
L1_1 = L1_1()
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.FileDescription
if L2_1 then
  L2_1 = L1_1.InternalName
  if L2_1 then
    L2_1 = L1_1.ProductName
    if L2_1 then
      L2_1 = L1_1.LegalCopyright
      if L2_1 then
        L2_1 = L1_1.CompanyName
        if L2_1 then
          goto lbl_98
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_98::
L2_1 = L1_1.FileDescription
L3_1 = L1_1.InternalName
if L2_1 == L3_1 then
  L2_1 = L1_1.InternalName
  L3_1 = L1_1.ProductName
  if L2_1 == L3_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1.LegalCopyright
    L4_1 = L3_1
    L3_1 = L3_1.lower
    L3_1 = L3_1(L4_1)
    L4_1 = "copyright (c)"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1.LegalCopyright
      L4_1 = L3_1
      L3_1 = L3_1.lower
      L3_1 = L3_1(L4_1)
      L4_1 = L1_1.InternalName
      L5_1 = L4_1
      L4_1 = L4_1.lower
      L4_1 = L4_1(L5_1)
      L5_1 = " team"
      L4_1 = L4_1 .. L5_1
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1.LegalCopyright
        L4_1 = L3_1
        L3_1 = L3_1.lower
        L3_1 = L3_1(L4_1)
        L4_1 = L1_1.InternalName
        L5_1 = L4_1
        L4_1 = L4_1.lower
        L4_1 = L4_1(L5_1)
        L5_1 = " inc."
        L4_1 = L4_1 .. L5_1
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          goto lbl_160
        end
      end
      L2_1 = L1_1.CompanyName
      L3_1 = L2_1
      L2_1 = L2_1.lower
      L2_1 = L2_1(L3_1)
      L3_1 = L1_1.InternalName
      L4_1 = L3_1
      L3_1 = L3_1.lower
      L3_1 = L3_1(L4_1)
      L4_1 = " team"
      L3_1 = L3_1 .. L4_1
      if L2_1 == L3_1 then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
::lbl_160::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
