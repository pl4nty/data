local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = 1
L4_1 = L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = sigattr_tail
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.utf8p2
  L8_1 = sigattr_tail
  L8_1 = L8_1[L6_1]
  L8_1 = L8_1.attribute
  if L8_1 == 16491 then
    L9_1 = L7_1
    L8_1 = L7_1.find
    L10_1 = "filetype:unknown"
    L11_1 = 1
    L12_1 = true
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if L8_1 then
      L8_1 = {}
      L9_1 = string
      L9_1 = L9_1.gmatch
      L10_1 = L7_1
      L11_1 = "(%w+):([^;]*)"
      L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
      for L12_1, L13_1 in L9_1, L10_1, L11_1 do
        L8_1[L12_1] = L13_1
      end
      L9_1 = tonumber
      L10_1 = L8_1.entropy
      L9_1 = L9_1(L10_1)
      if 6 <= L9_1 then
        L9_1 = L8_1.filepath
        if L9_1 then
          L9_1 = L8_1.filepath
          L10_1 = L9_1
          L9_1 = L9_1.lower
          L9_1 = L9_1(L10_1)
          L10_1 = L1_1[L9_1]
          if L10_1 == nil then
            L1_1[L9_1] = L6_1
            L11_1 = L9_1
            L10_1 = L9_1.match
            L12_1 = "%.[^%.]+$"
            L10_1 = L10_1(L11_1, L12_1)
            if L10_1 then
              L11_1 = mp
              L11_1 = L11_1.GetExtensionClass
              L12_1 = L10_1
              L11_1 = L11_1(L12_1)
              if L11_1 == 0 then
                L11_1 = L2_1[L10_1]
                if L11_1 ~= nil then
                  L11_1 = table
                  L11_1 = L11_1.insert
                  L12_1 = L2_1[L10_1]
                  L13_1 = L9_1
                  L11_1(L12_1, L13_1)
                else
                  L11_1 = {}
                  L12_1 = L9_1
                  L11_1[1] = L12_1
                  L2_1[L10_1] = L11_1
                end
              end
            end
          end
        end
      end
    end
  end
end
L3_1 = {}
L4_1 = pairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = #L8_1
  if 10 <= L9_1 then
    L9_1 = pairs
    L10_1 = L8_1
    L9_1, L10_1, L11_1 = L9_1(L10_1)
    for L12_1, L13_1 in L9_1, L10_1, L11_1 do
      L14_1 = table
      L14_1 = L14_1.insert
      L15_1 = L3_1
      L16_1 = L13_1
      L14_1(L15_1, L16_1)
    end
  end
end
L4_1 = #L3_1
if 10 <= L4_1 then
  L4_1 = {}
  L5_1 = #L3_1
  L4_1.count = L5_1
  L4_1.file_list = L3_1
  L5_1 = bm
  L5_1 = L5_1.trigger_sig
  L6_1 = "GenericRansomware:HighEntropyUnkFileMeta"
  L7_1 = safeJsonSerialize
  L8_1 = L4_1
  L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L7_1(L8_1)
  L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
