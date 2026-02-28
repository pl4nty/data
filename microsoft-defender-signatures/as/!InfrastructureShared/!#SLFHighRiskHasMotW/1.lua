local L0_1, L1_1, L2_1, L3_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = mp
  L0_2 = L0_2.GetCertificateInfo
  L0_2 = L0_2()
  L1_2 = pairs
  L2_2 = L0_2
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = L5_2.Signers
    if L6_2 ~= nil then
      L6_2 = true
      return L6_2
    end
  end
  L1_2 = false
  return L1_2
end

is_signed = L0_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_HAS_MOTW_ADS
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = mp
    L2_1 = L2_1.get_contextdata
    L3_1 = mp
    L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
    L2_1, L3_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 ~= "uTorrent.exe" then
      L2_1 = is_signed
      L2_1 = L2_1()
      if L2_1 == false then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
