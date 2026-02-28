local L0_1, L1_1, L2_1
L0_1 = pe
L0_1 = L0_1.contains_va
L1_1 = 2
L2_1 = hstrlog
L2_1 = L2_1[1]
L2_1 = L2_1.VA
L0_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L0_1 = pesecs
  L0_1 = L0_1[2]
  L0_1 = L0_1.SizeOfRawData
  if 256 <= L0_1 then
    L0_1 = pesecs
    L0_1 = L0_1[2]
    L0_1 = L0_1.SizeOfRawData
    if L0_1 <= 512 then
      L0_1 = pe
      L0_1 = L0_1.contains_va
      L1_1 = 1
      L2_1 = hstrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.VA
      L0_1 = L0_1(L1_1, L2_1)
      if L0_1 then
        L0_1 = pesecs
        L0_1 = L0_1[1]
        L0_1 = L0_1.VirtualSize
        if 65536 <= L0_1 then
          L0_1 = pesecs
          L0_1 = L0_1[1]
          L0_1 = L0_1.VirtualSize
          if L0_1 <= 196608 then
            L0_1 = pehdr
            L0_1 = L0_1.SizeOfImage
            if 1048576 < L0_1 then
              L0_1 = pehdr
              L0_1 = L0_1.SizeOfImage
              if L0_1 < 1572864 then
                L0_1 = peattributes
                L0_1 = L0_1.lastscn_writable
                if not L0_1 then
                  L0_1 = peattributes
                  L0_1 = L0_1.lastscn_executable
                  if not L0_1 then
                    L0_1 = mp
                    L0_1 = L0_1.changedetectionname
                    L1_1 = 268436397
                    L0_1(L1_1)
                    L0_1 = mp
                    L0_1 = L0_1.INFECTED
                    return L0_1
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
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
