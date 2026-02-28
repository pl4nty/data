local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 < 65536 and 1048576 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if not (L2_1 <= 5) then
    goto lbl_27
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_27::
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "inv_2022%d%d%d%d december soa%.xlsx"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "rfq%-%d%d%d%d%d%d%.xlsx"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == nil then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "2022%- %d%.xlsx"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == nil then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = "xvs022%-%d%d%d%d22%.xlsx"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == nil then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L0_1
        L4_1 = "po no a%d%d%d%-%d%d%d%.xlsx"
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 == nil then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L0_1
          L4_1 = "fob_ship doc_haiphong %d%d%d%d+hq_%.xlsx"
          L2_1 = L2_1(L3_1, L4_1)
          if L2_1 == nil then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L0_1
            L4_1 = "202201%d%d%d%d%d%d%d%d+%.xlsx"
            L2_1 = L2_1(L3_1, L4_1)
            if L2_1 == nil then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L0_1
              L4_1 = "inv %d%d%d z%&z intimates %(%d%d%d+2021%)%.xlsx"
              L2_1 = L2_1(L3_1, L4_1)
              if L2_1 == nil then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L0_1
                L4_1 = "lod4.xlsx"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if L2_1 == nil then
                  L2_1 = string
                  L2_1 = L2_1.find
                  L3_1 = L0_1
                  L4_1 = "myung in quotation request.xlsx"
                  L5_1 = 1
                  L6_1 = true
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if L2_1 == nil then
                    goto lbl_104
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_104::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
