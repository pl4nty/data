local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 500 < L0_1 and L0_1 < 5242880 then
  L1_1 = tostring
  L2_1 = footerpage
  L1_1 = L1_1(L2_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.bitor
  L4_1 = mp
  L4_1 = L4_1.bitor
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_FNAME
  L6_1 = mp
  L6_1 = L6_1.FILEPATH_QUERY_PATH
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L3_1(L4_1, L5_1)
  L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "\\cache\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = StringStartsWith
    L5_1 = L3_1
    L6_1 = "f_"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
  
  function L4_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2
    L2_2 = string
    L2_2 = L2_2.byte
    L3_2 = A0_2
    L4_2 = A1_2
    L5_2 = A1_2 + 3
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2)
    L6_2 = L2_2 * 256
    L6_2 = L6_2 + L3_2
    L6_2 = L6_2 * 256
    L6_2 = L6_2 + L4_2
    L6_2 = L6_2 * 256
    L6_2 = L6_2 + L5_2
    return L6_2
  end
  
  msb_unpack = L4_1
  
  function L4_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
    if A0_2 ~= nil then
      L3_2 = A1_2 + 12
      if A2_2 >= L3_2 then
        L3_2 = {}
        L4_2 = msb_unpack
        L5_2 = A0_2
        L6_2 = A1_2
        L4_2 = L4_2(L5_2, L6_2)
        L5_2 = msb_unpack
        L6_2 = A0_2
        L7_2 = A1_2 + 4
        L5_2 = L5_2(L6_2, L7_2)
        L6_2 = nil
        L7_2 = A1_2 + 4
        L7_2 = L7_2 + L4_2
        L7_2 = A2_2 - L7_2
        if 0 < L7_2 then
          L7_2 = msb_unpack
          L8_2 = A0_2
          L9_2 = A1_2 + L4_2
          L9_2 = L9_2 + 8
          L7_2 = L7_2(L8_2, L9_2)
          L6_2 = L7_2
          if 0 < L4_2 then
            L7_2 = A1_2 + 5
            L3_2.databegin = L7_2
            L7_2 = L3_2.databegin
            L7_2 = L7_2 + L4_2
            L3_2.dataend = L7_2
          end
          L7_2 = A1_2 + L4_2
          L7_2 = L7_2 + 12
          L3_2.next = L7_2
        end
        L3_2.length = L4_2
        L3_2.type = L5_2
        L3_2.crc = L6_2
        return L3_2
      end
    end
    L3_2 = nil
    return L3_2
  end
  
  process_chunk = L4_1
  L4_1 = nil
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "IEND"
  L8_1 = 1
  L9_1 = true
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 and L6_1 then
    L7_1 = process_chunk
    L8_1 = L1_1
    L9_1 = L5_1 - 4
    L10_1 = L0_1
    L7_1 = L7_1(L8_1, L9_1, L10_1)
    L4_1 = L7_1
  end
  if L5_1 == nil or L4_1 == nil then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:PngWithoutIENDFooter"
    L7_1(L8_1)
  else
    L7_1 = L4_1.length
    if 0 < L7_1 then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "Lua:PngWithAbnormalIENDLength"
      L7_1(L8_1)
    end
    L7_1 = L6_1 + 4
    if L0_1 < L7_1 then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "Lua:PngWithDataAfterIEND"
      L7_1(L8_1)
    end
    L7_1 = L4_1.crc
    if L7_1 ~= 2923585666 then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "Lua:PngWithAbnormalIENDCrc"
      L7_1(L8_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
