local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.GetUACMetadata
L0_1 = L0_1()
L1_1 = L0_1.Type
L2_1 = mp
L2_1 = L2_1.AMSI_UAC_REQUEST_TYPE_EXE
if L1_1 == L2_1 then
  L1_1 = L0_1.AutoElevate
  if L1_1 == true then
    L1_1 = mp
    L1_1 = L1_1.TriggerScanResource
    L2_1 = "file"
    L3_1 = L0_1.Info
    L3_1 = L3_1.ApplicationName
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    if L1_1 == L2_1 then
      L1_1 = mp
      L1_1 = L1_1.TRUE
      return L1_1
    end
  end
end
L1_1 = L0_1.Type
L2_1 = mp
L2_1 = L2_1.AMSI_UAC_REQUEST_TYPE_COM
if L1_1 == L2_1 then
  L1_1 = string
  L1_1 = L1_1.upper
  L2_1 = L0_1.Info
  L2_1 = L2_1.Clsid
  L1_1 = L1_1(L2_1)
  if L1_1 ~= "3AD05575-8857-4850-9277-11B85BDB8E09" then
    L1_1 = string
    L1_1 = L1_1.upper
    L2_1 = L0_1.Info
    L2_1 = L2_1.Clsid
    L1_1 = L1_1(L2_1)
    if L1_1 ~= "4D111E08-CBF7-4f12-A926-2C7920AF52FC" then
      goto lbl_57
    end
  end
  L1_1 = mp
  L1_1 = L1_1.TriggerScanResource
  L2_1 = "file"
  L3_1 = L0_1.Info
  L3_1 = L3_1.Requestor
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  if L1_1 == L2_1 then
    L1_1 = mp
    L1_1 = L1_1.TRUE
    return L1_1
  end
end
::lbl_57::
L1_1 = mp
L1_1 = L1_1.FALSE
return L1_1
