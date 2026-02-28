local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 9) then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "\\users\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 ~= nil then
      goto lbl_35
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_35::
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "\\users\\(.+)$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 1) then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 == nil then
      goto lbl_57
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_57::
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = 0
L5_1 = 4
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == "\\\\?\\" then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L0_1
  L4_1 = 5
  L2_1 = L2_1(L3_1, L4_1)
  L0_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "(.+)\\users\\.+$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 1) then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      goto lbl_93
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_93::
L3_1 = peattributes
L3_1 = L3_1.isdll
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousFileInUsersFolder.B!dll"
  L3_1(L4_1)
else
  L3_1 = peattributes
  L3_1 = L3_1.isexe
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:SuspiciousFileInUsersFolder.B!exe"
    L3_1(L4_1)
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
