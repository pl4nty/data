local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = false
L1_1 = mp
L1_1 = L1_1.get_mpattributesubstring
L2_1 = "ATTR:ConHost_"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "ATTR:ConHost_dir_T1083_FileAndDirectoryDiscovery"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = TrackPidAndTechnique
    L2_1 = "RTP"
    L3_1 = "T1083"
    L4_1 = "ConHost_dir_T1083_FileAndDirectoryDiscovery"
    L1_1(L2_1, L3_1, L4_1)
    L0_1 = true
  else
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "ATTR:ConHost_dir_T1552_001_CredentialsInFiles"
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L1_1 = TrackPidAndTechnique
      L2_1 = "RTP"
      L3_1 = "T1552.001"
      L4_1 = "ConHost_dir_T1552_001_CredentialsInFiles"
      L1_1(L2_1, L3_1, L4_1)
      L0_1 = true
    else
      L1_1 = mp
      L1_1 = L1_1.get_mpattribute
      L2_1 = "ATTR:ConHost_dir_T1087_001_Account_Discovery_Local_Account"
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L1_1 = TrackPidAndTechnique
        L2_1 = "RTP"
        L3_1 = "T1087.001"
        L4_1 = "ConHost_dir_T1087_001_Account_Discovery_Local_Account"
        L1_1(L2_1, L3_1, L4_1)
        L0_1 = true
      else
        L1_1 = mp
        L1_1 = L1_1.get_mpattribute
        L2_1 = "ATTR:ConHost_dir_T1552_004_PrivateKeys"
        L1_1 = L1_1(L2_1)
        if L1_1 then
          L1_1 = TrackPidAndTechnique
          L2_1 = "RTP"
          L3_1 = "T1552.004"
          L4_1 = "ConHost_dir_T1552_004_PrivateKeys"
          L1_1(L2_1, L3_1, L4_1)
          L0_1 = true
        else
          L1_1 = mp
          L1_1 = L1_1.get_mpattribute
          L2_1 = "ATTR:ConHost_type_T1552_001_CredentialsInFiles"
          L1_1 = L1_1(L2_1)
          if L1_1 then
            L1_1 = TrackPidAndTechnique
            L2_1 = "RTP"
            L3_1 = "T1552.001"
            L4_1 = "ConHost_type_T1552_001_CredentialsInFiles"
            L1_1(L2_1, L3_1, L4_1)
            L0_1 = true
          else
            L1_1 = mp
            L1_1 = L1_1.get_mpattribute
            L2_1 = "ATTR:ConHost_del_T1070_004_FileDeletion"
            L1_1 = L1_1(L2_1)
            if L1_1 then
              L1_1 = TrackPidAndTechnique
              L2_1 = "RTP"
              L3_1 = "T1070.004"
              L4_1 = "ConHost_del_T1070_004_FileDeletion"
              L1_1(L2_1, L3_1, L4_1)
              L0_1 = true
            else
              L1_1 = mp
              L1_1 = L1_1.get_mpattribute
              L2_1 = "ATTR:ConHost_del_T1490_InhibitSystemRecovery"
              L1_1 = L1_1(L2_1)
              if L1_1 then
                L1_1 = TrackPidAndTechnique
                L2_1 = "RTP"
                L3_1 = "T1490"
                L4_1 = "ConHost_del_T1490_InhibitSystemRecovery"
                L1_1(L2_1, L3_1, L4_1)
                L0_1 = true
              else
                L1_1 = mp
                L1_1 = L1_1.get_mpattribute
                L2_1 = "ATTR:ConHost_ver_T1082_SystemInformationDiscovery"
                L1_1 = L1_1(L2_1)
                if L1_1 then
                  L1_1 = TrackPidAndTechnique
                  L2_1 = "RTP"
                  L3_1 = "T1082"
                  L4_1 = "ConHost_ver_T1082_SystemInformationDiscovery"
                  L1_1(L2_1, L3_1, L4_1)
                  L0_1 = true
                else
                  L1_1 = mp
                  L1_1 = L1_1.get_mpattribute
                  L2_1 = "ATTR:ConHost_set_T1574_007_PathInterByPathEnv"
                  L1_1 = L1_1(L2_1)
                  if L1_1 then
                    L1_1 = TrackPidAndTechnique
                    L2_1 = "RTP"
                    L3_1 = "T1574.007"
                    L4_1 = "ConHost_set_T1574_007_PathInterByPathEnv"
                    L1_1(L2_1, L3_1, L4_1)
                    L0_1 = true
                  else
                    L1_1 = mp
                    L1_1 = L1_1.get_mpattribute
                    L2_1 = "ATTR:ConHost_set_T1033_SystemOwnerUserDiscovery"
                    L1_1 = L1_1(L2_1)
                    if L1_1 then
                      L1_1 = TrackPidAndTechnique
                      L2_1 = "RTP"
                      L3_1 = "T1033"
                      L4_1 = "ConHost_set_T1033_SystemOwnerUserDiscovery"
                      L1_1(L2_1, L3_1, L4_1)
                      L0_1 = true
                    else
                      L1_1 = mp
                      L1_1 = L1_1.get_mpattribute
                      L2_1 = "ATTR:ConHost_set_T1087_001_LocalAccount"
                      L1_1 = L1_1(L2_1)
                      if L1_1 then
                        L1_1 = TrackPidAndTechnique
                        L2_1 = "RTP"
                        L3_1 = "T1087.001"
                        L4_1 = "ConHost_set_T1087_001_LocalAccount"
                        L1_1(L2_1, L3_1, L4_1)
                        L0_1 = true
                      else
                        L1_1 = mp
                        L1_1 = L1_1.get_mpattribute
                        L2_1 = "ATTR:ConHost_set_T1083_FileAndDirectoryDiscovery"
                        L1_1 = L1_1(L2_1)
                        if L1_1 then
                          L1_1 = TrackPidAndTechnique
                          L2_1 = "RTP"
                          L3_1 = "T1083"
                          L4_1 = "ConHost_set_T1083_FileAndDirectoryDiscovery"
                          L1_1(L2_1, L3_1, L4_1)
                          L0_1 = true
                        else
                          L1_1 = mp
                          L1_1 = L1_1.get_mpattribute
                          L2_1 = "ATTR:ConHost_datetime_T1124_SystemTimeDiscovery"
                          L1_1 = L1_1(L2_1)
                          if L1_1 then
                            L1_1 = TrackPidAndTechnique
                            L2_1 = "RTP"
                            L3_1 = "T1124"
                            L4_1 = "ConHost_datetime_T1124_SystemTimeDiscovery"
                            L1_1(L2_1, L3_1, L4_1)
                            L0_1 = true
                          else
                            L1_1 = mp
                            L1_1 = L1_1.get_mpattribute
                            L2_1 = "ATTR:ConHost_path_T1574_007__PathInterByPathEnv"
                            L1_1 = L1_1(L2_1)
                            if L1_1 then
                              L1_1 = TrackPidAndTechnique
                              L2_1 = "RTP"
                              L3_1 = "T1574.007"
                              L4_1 = "ConHost_path_T1574_007__PathInterByPathEnv"
                              L1_1(L2_1, L3_1, L4_1)
                              L0_1 = true
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
        end
      end
    end
  end
  if L0_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
