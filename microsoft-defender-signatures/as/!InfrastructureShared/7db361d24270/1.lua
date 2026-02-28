local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.wp2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.wp2
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L1_1 = L1_1.wp2
      if L1_1 ~= nil then
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L2_1 = L2_1.utf8p2
        L1_1 = L1_1(L2_1)
        L0_1 = L1_1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L1_1 = L1_1.wp2
        if L1_1 ~= nil then
          L1_1 = string
          L1_1 = L1_1.lower
          L2_1 = this_sigattrlog
          L2_1 = L2_1[4]
          L2_1 = L2_1.utf8p2
          L1_1 = L1_1(L2_1)
          L0_1 = L1_1
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[5]
          L1_1 = L1_1.wp2
          if L1_1 ~= nil then
            L1_1 = string
            L1_1 = L1_1.lower
            L2_1 = this_sigattrlog
            L2_1 = L2_1[5]
            L2_1 = L2_1.utf8p2
            L1_1 = L1_1(L2_1)
            L0_1 = L1_1
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[6]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[6]
            L1_1 = L1_1.wp2
            if L1_1 ~= nil then
              L1_1 = string
              L1_1 = L1_1.lower
              L2_1 = this_sigattrlog
              L2_1 = L2_1[6]
              L2_1 = L2_1.utf8p2
              L1_1 = L1_1(L2_1)
              L0_1 = L1_1
            end
          end
        end
      end
    end
  end
end
if L0_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "copy-as-is"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "/usr/share/rear"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 then
        goto lbl_169
      end
    end
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "/opt/conjur/backup/"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "--exclude=ui.key"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 then
        goto lbl_169
      end
    end
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "/apache-tomcat/workforce.keystore"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "/foreman"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_172
      end
    end
    ::lbl_169::
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  ::lbl_172::
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "/etc/sudoers"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "/.ssh/id_rsa"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "/.ssh/id_rsa.pub"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "/.ssh/id_dsa"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "/.ssh/id_dsa.pub"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "/.ssh/identity"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "/.ssh/identity.pub"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if not L1_1 then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "/.ssh/ssh_host_dsa_key"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if not L1_1 then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "/.ssh/ssh_host_dsa_key.pub"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if not L1_1 then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "/.ssh/ssh_host_rsa_key"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if not L1_1 then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "/.ssh/ssh_host_rsa_key.pub"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if not L1_1 then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "/.ssh/ssh_host_key"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if not L1_1 then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "/.ssh/ssh_host_key.pub"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if not L1_1 then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = "/.ssh/authorized_keys"
                            L4_1 = 1
                            L5_1 = true
                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                            if not L1_1 then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = "/.ssh/known_hosts"
                              L4_1 = 1
                              L5_1 = true
                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                              if not L1_1 then
                                L1_1 = string
                                L1_1 = L1_1.find
                                L2_1 = L0_1
                                L3_1 = "/.bash_history"
                                L4_1 = 1
                                L5_1 = true
                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                if not L1_1 then
                                  L1_1 = string
                                  L1_1 = L1_1.find
                                  L2_1 = L0_1
                                  L3_1 = "/etc/hosts"
                                  L4_1 = 1
                                  L5_1 = true
                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                  if not L1_1 then
                                    L1_1 = string
                                    L1_1 = L1_1.find
                                    L2_1 = L0_1
                                    L3_1 = "/etc/group"
                                    L4_1 = 1
                                    L5_1 = true
                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                    if not L1_1 then
                                      L1_1 = string
                                      L1_1 = L1_1.find
                                      L2_1 = L0_1
                                      L3_1 = "/etc/passwd"
                                      L4_1 = 1
                                      L5_1 = true
                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                      if not L1_1 then
                                        L1_1 = string
                                        L1_1 = L1_1.find
                                        L2_1 = L0_1
                                        L3_1 = "/etc/gshadow"
                                        L4_1 = 1
                                        L5_1 = true
                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                        if not L1_1 then
                                          L1_1 = string
                                          L1_1 = L1_1.find
                                          L2_1 = L0_1
                                          L3_1 = "/etc/shadow"
                                          L4_1 = 1
                                          L5_1 = true
                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                          if not L1_1 then
                                            L1_1 = string
                                            L1_1 = L1_1.find
                                            L2_1 = L0_1
                                            L3_1 = "/.aws/credentials"
                                            L4_1 = 1
                                            L5_1 = true
                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                            if not L1_1 then
                                              L1_1 = string
                                              L1_1 = L1_1.find
                                              L2_1 = L0_1
                                              L3_1 = "/.aws/config"
                                              L4_1 = 1
                                              L5_1 = true
                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                              if not L1_1 then
                                                L1_1 = string
                                                L1_1 = L1_1.find
                                                L2_1 = L0_1
                                                L3_1 = "/.docker/config.json"
                                                L4_1 = 1
                                                L5_1 = true
                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                if not L1_1 then
                                                  L1_1 = string
                                                  L1_1 = L1_1.find
                                                  L2_1 = L0_1
                                                  L3_1 = ".pfx"
                                                  L4_1 = 1
                                                  L5_1 = true
                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                  if not L1_1 then
                                                    L1_1 = string
                                                    L1_1 = L1_1.find
                                                    L2_1 = L0_1
                                                    L3_1 = ".key"
                                                    L4_1 = 1
                                                    L5_1 = true
                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                    if not L1_1 then
                                                      L1_1 = string
                                                      L1_1 = L1_1.find
                                                      L2_1 = L0_1
                                                      L3_1 = ".ppk"
                                                      L4_1 = 1
                                                      L5_1 = true
                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                      if not L1_1 then
                                                        L1_1 = string
                                                        L1_1 = L1_1.find
                                                        L2_1 = L0_1
                                                        L3_1 = ".keytab"
                                                        L4_1 = 1
                                                        L5_1 = true
                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                        if not L1_1 then
                                                          L1_1 = string
                                                          L1_1 = L1_1.find
                                                          L2_1 = L0_1
                                                          L3_1 = ".htpasswd"
                                                          L4_1 = 1
                                                          L5_1 = true
                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                          if not L1_1 then
                                                            L1_1 = string
                                                            L1_1 = L1_1.find
                                                            L2_1 = L0_1
                                                            L3_1 = "private-keys-v1.d"
                                                            L4_1 = 1
                                                            L5_1 = true
                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                            if not L1_1 then
                                                              L1_1 = string
                                                              L1_1 = L1_1.find
                                                              L2_1 = L0_1
                                                              L3_1 = "/secring.gpg"
                                                              L4_1 = 1
                                                              L5_1 = true
                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                              if not L1_1 then
                                                                goto lbl_470
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
      end
    end
  end
  L1_1 = reportRelatedBmHits
  L1_1()
  L1_1 = addRelatedProcess
  L1_1()
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1552"
  L4_1 = "CredentialAccess_ArchiveData"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1560"
  L4_1 = "Collection_ArchiveData"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = RemediateProcessTreeForLinux
  L1_1()
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_470::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
