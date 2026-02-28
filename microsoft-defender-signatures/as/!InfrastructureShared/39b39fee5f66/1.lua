local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.ppid
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.ppid
    L2_1 = mp
    L2_1 = L2_1.GetProcessCommandLine
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.ppid
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L2_1 = L3_1.ppid
  end
end
L3_1 = nil
L4_1 = nil
if L2_1 ~= nil then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[2]
  L4_1 = L5_1.image_path
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L6_1 = L5_1
  L5_1 = L5_1.match
  L7_1 = "\\([^\\]+)$"
  L5_1 = L5_1(L6_1, L7_1)
  L3_1 = L5_1
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = L3_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 ~= nil and L1_1 == L2_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  else
    L5_1 = mp
    L5_1 = L5_1.GetParentProcInfo
    L6_1 = L1_1
    L5_1 = L5_1(L6_1)
    if L5_1 ~= nil then
      L6_1 = L5_1.image_path
      if L6_1 ~= nil then
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = L5_1.image_path
        L6_1 = L6_1(L7_1)
        L7_1 = L6_1
        L6_1 = L6_1.match
        L8_1 = "\\([^\\]+)$"
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 ~= nil then
          L7_1 = string
          L7_1 = L7_1.find
          L8_1 = L6_1
          L9_1 = L3_1
          L7_1 = L7_1(L8_1, L9_1)
          if L7_1 ~= nil then
            L7_1 = L5_1.ppid
            if L7_1 == L2_1 then
              L7_1 = mp
              L7_1 = L7_1.INFECTED
              return L7_1
          end
        end
        else
          L7_1 = mp
          L7_1 = L7_1.GetParentProcInfo
          L8_1 = L5_1.ppid
          L7_1 = L7_1(L8_1)
          if L7_1 ~= nil then
            L8_1 = L7_1.image_path
            if L8_1 ~= nil then
              L8_1 = string
              L8_1 = L8_1.lower
              L9_1 = L7_1.image_path
              L8_1 = L8_1(L9_1)
              L9_1 = L8_1
              L8_1 = L8_1.match
              L10_1 = "\\([^\\]+)$"
              L8_1 = L8_1(L9_1, L10_1)
              if L8_1 ~= nil then
                L9_1 = string
                L9_1 = L9_1.find
                L10_1 = L8_1
                L11_1 = L3_1
                L9_1 = L9_1(L10_1, L11_1)
                if L9_1 then
                  L9_1 = L7_1.ppid
                  if L9_1 == L2_1 then
                    L9_1 = mp
                    L9_1 = L9_1.INFECTED
                    return L9_1
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
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
