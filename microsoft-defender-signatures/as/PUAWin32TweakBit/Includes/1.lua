local L0_1, L1_1, L2_1
L0_1 = checkProductName
L1_1 = "TweakBit PCRepairKit"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = checkProductVersion
  L1_1 = "LT"
  L2_1 = "1.8.3.40"
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = checkProductName
L1_1 = "TweakBit Driver Updater"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = checkProductVersion
  L1_1 = "LT"
  L2_1 = "2.0.1.12"
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = checkProductName
L1_1 = "Driver Updater"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = checkFileVersion
  L1_1 = "LT"
  L2_1 = "2.0.0.4"
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = checkProductName
L1_1 = "TweakBit PCSuite"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = checkProductVersion
  L1_1 = "LT"
  L2_1 = "10.0.23.0"
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = checkProductName
L1_1 = "PCRepairKit"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = checkFileVersion
  L1_1 = "LT"
  L2_1 = "1.8.3.40"
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = checkProductName
L1_1 = "TweakBit PCBooster"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = checkProductVersion
  L1_1 = "LT"
  L2_1 = "1.8.4.2"
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
