local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = mp
    L1_1 = L1_1.GetParentProcInfo
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if L1_1 ~= nil then
      L2_1 = L1_1.image_path
      if L2_1 ~= nil then
        L2_1 = sysio
        L2_1 = L2_1.IsFileExists
        L3_1 = L1_1.image_path
        L2_1 = L2_1(L3_1)
        if L2_1 then
          L2_1 = mp
          L2_1 = L2_1.GetParentProcInfo
          L3_1 = L1_1.ppid
          L2_1 = L2_1(L3_1)
          if L2_1 ~= nil then
            L3_1 = L2_1.image_path
            if L3_1 ~= nil then
              L3_1 = sysio
              L3_1 = L3_1.IsFileExists
              L4_1 = L2_1.image_path
              L3_1 = L3_1(L4_1)
              if L3_1 then
                L3_1 = bm
                L3_1 = L3_1.add_related_file
                L4_1 = L2_1.image_path
                L3_1(L4_1)
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
