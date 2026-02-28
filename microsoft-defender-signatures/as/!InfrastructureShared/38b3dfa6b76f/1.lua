local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "kobdrvapiw64"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if L1_2 ~= nil then
    L1_2 = false
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "dismhost"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if L1_2 ~= nil then
    L1_2 = false
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "tracerpt"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if L1_2 ~= nil then
    L1_2 = false
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "printisolationhost"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if L1_2 ~= nil then
    L1_2 = false
    return L1_2
  end
  L1_2 = true
  return L1_2
end

is_target = L0_1
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  end
end
if L0_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = is_target
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L0_1
      L2_1(L3_1)
    else
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = is_target
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L1_1
      L2_1(L3_1)
      L2_1 = MpCommon
      L2_1 = L2_1.AppendPersistContext
      L3_1 = L1_1
      L4_1 = "MasqSuspCopyTarget"
      L5_1 = 3600
      L2_1(L3_1, L4_1, L5_1)
      L2_1 = {}
      L3_1 = "T1036.003:masquerading_target"
      L4_1 = "T1036.003:defenseevasion_target"
      L5_1 = "T1036.003:MasqSuspCopy.A"
      L2_1[1] = L3_1
      L2_1[2] = L4_1
      L2_1[3] = L5_1
      L3_1 = TrackFileAndTechnique
      L4_1 = L1_1
      L5_1 = L2_1
      L3_1(L4_1, L5_1)
    else
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
