local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
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
      goto lbl_42
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_42::
L1_1 = mp
L1_1 = L1_1.ContextualExpandEnvironmentVariables
L2_1 = "%userprofile%"
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = #L1_1
if L2_1 < 9 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
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
if L0_1 == L1_1 then
  L2_1 = peattributes
  L2_1 = L2_1.isdll
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:SuspiciousFileInUsersFolder.A!dll"
    L2_1(L3_1)
  else
    L2_1 = peattributes
    L2_1 = L2_1.isexe
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:SuspiciousFileInUsersFolder.A!exe"
      L2_1(L3_1)
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
