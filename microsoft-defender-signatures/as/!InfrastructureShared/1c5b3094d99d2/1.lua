local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = string
      L0_1 = L0_1.lower
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L1_1 = L1_1.utf8p2
      L0_1 = L0_1(L1_1)
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "\\paexec"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "winexesvc.exe"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "csexecsvc.exe"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = mp
            L1_1 = L1_1.CLEAN
            return L1_1
          end
        end
      end
      L2_1 = L0_1
      L1_1 = L0_1.match
      L3_1 = "([^\\]+)$"
      L1_1 = L1_1(L2_1, L3_1)
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "(.+%.exe).-$"
      L2_1 = L2_1(L3_1, L4_1)
      L1_1 = L2_1
      L2_1 = bm
      L2_1 = L2_1.get_process_relationships
      L2_1, L3_1 = L2_1()
      L4_1 = ipairs
      L5_1 = L3_1
      L4_1, L5_1, L6_1 = L4_1(L5_1)
      for L7_1, L8_1 in L4_1, L5_1, L6_1 do
        L9_1 = string
        L9_1 = L9_1.lower
        L10_1 = MpCommon
        L10_1 = L10_1.PathToWin32Path
        L11_1 = L8_1.image_path
        L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L10_1(L11_1)
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
        L10_1 = L8_1.reason
        L11_1 = bm
        L11_1 = L11_1.RELATIONSHIP_CREATED
        if L10_1 == L11_1 then
          L10_1 = string
          L10_1 = L10_1.find
          L11_1 = L9_1
          L12_1 = L1_1
          L13_1 = 1
          L14_1 = true
          L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
          if L10_1 then
            L10_1 = IsKeyInRollingQueue
            L11_1 = "SuspExeFileDroppedViaSMB"
            L12_1 = L9_1
            L13_1 = true
            L10_1 = L10_1(L11_1, L12_1, L13_1)
            if L10_1 then
              L11_1 = bm
              L11_1 = L11_1.get_process_relationships
              L12_1 = L8_1.ppid
              L11_1, L12_1 = L11_1(L12_1)
              L13_1 = ipairs
              L14_1 = L12_1
              L13_1, L14_1, L15_1 = L13_1(L14_1)
              for L16_1, L17_1 in L13_1, L14_1, L15_1 do
                L18_1 = L17_1.reason
                L19_1 = bm
                L19_1 = L19_1.RELATIONSHIP_CREATED
                if L18_1 == L19_1 then
                  L18_1 = bm
                  L18_1 = L18_1.add_related_process
                  L19_1 = L17_1.ppid
                  L18_1(L19_1)
                  L18_1 = TrackPidAndTechniqueBM
                  L19_1 = L17_1.ppid
                  L20_1 = "T1021.002"
                  L21_1 = "remoteservice_created_d"
                  L18_1(L19_1, L20_1, L21_1)
                end
              end
              L13_1 = bm
              L13_1 = L13_1.add_related_file
              L14_1 = L9_1
              L13_1(L14_1)
              L13_1 = TrackPidAndTechniqueBM
              L14_1 = L8_1.ppid
              L15_1 = "T1021.002"
              L16_1 = "remoteservice_svc_d"
              L13_1(L14_1, L15_1, L16_1)
              L13_1 = mp
              L13_1 = L13_1.INFECTED
              return L13_1
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
