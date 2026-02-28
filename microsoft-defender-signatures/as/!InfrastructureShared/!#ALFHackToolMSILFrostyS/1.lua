local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 180000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_versioninfo
L1_1 = L1_1()
L2_1 = {}
L2_1.SMEditor = 1
L2_1.SMNet = 1
L2_1.StockMarketView = 1
L3_1 = {}
L3_1["SMEditor.exe"] = 1
L3_1["SMNet.exe"] = 1
L3_1["StockMarketView.exe"] = 1
if L1_1 ~= nil then
  L4_1 = L1_1.ProductName
  if L4_1 ~= nil then
    L4_1 = L1_1.ProductName
    L4_1 = L2_1[L4_1]
    if L4_1 == 1 then
      L4_1 = L1_1.FileDescription
      if L4_1 ~= nil then
        L4_1 = L1_1.FileDescription
        L4_1 = L2_1[L4_1]
        if L4_1 == 1 then
          L4_1 = L1_1.OriginalFilename
          if L4_1 ~= nil then
            L4_1 = L1_1.OriginalFilename
            L4_1 = L3_1[L4_1]
            if L4_1 == 1 then
              L4_1 = mp
              L4_1 = L4_1.INFECTED
              return L4_1
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
