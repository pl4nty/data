local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:Context/FileInADS.A!commonadslist"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if L0_1 < 4096 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.bitor
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_FNAME
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_PATH
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
    L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
    if L2_1 ~= nil then
      L3_1 = #L2_1
      if 2 <= L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = ":"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 and L1_1 ~= nil then
          L3_1 = #L1_1
          if 2 <= L3_1 then
            L4_1 = L1_1
            L3_1 = L1_1.sub
            L5_1 = 1
            L6_1 = 8
            L3_1 = L3_1(L4_1, L5_1, L6_1)
            if L3_1 == "\\device\\" then
              L3_1 = MpCommon
              L3_1 = L3_1.PathToWin32Path
              L4_1 = L1_1
              L3_1 = L3_1(L4_1)
              L1_1 = L3_1
              if not L1_1 then
                L3_1 = mp
                L3_1 = L3_1.CLEAN
                return L3_1
              end
              L3_1 = string
              L3_1 = L3_1.lower
              L4_1 = L1_1
              L3_1 = L3_1(L4_1)
              L1_1 = L3_1
            end
            L3_1 = L1_1
            L4_1 = "\\"
            L5_1 = L2_1
            L3_1 = L3_1 .. L4_1 .. L5_1
            L4_1 = mp
            L4_1 = L4_1.get_mpattribute
            L5_1 = "BM_MZ_FILE"
            L4_1 = L4_1(L5_1)
            if L4_1 then
              if L0_1 == "ctxbace.exe" then
                L4_1 = mp
                L4_1 = L4_1.CLEAN
                return L4_1
              end
              L4_1 = mp
              L4_1 = L4_1.set_mpattribute
              L5_1 = "BM_PeFileInAlternateDataStream"
              L4_1(L5_1)
              L4_1 = MpCommon
              L4_1 = L4_1.QueryPersistContext
              L5_1 = L3_1
              L6_1 = "PeWrite2AlternateDataStream"
              L4_1 = L4_1(L5_1, L6_1)
              if not L4_1 then
                L5_1 = MpCommon
                L5_1 = L5_1.AppendPersistContext
                L6_1 = L3_1
                L7_1 = "PeWrite2AlternateDataStream"
                L8_1 = 100
                L5_1(L6_1, L7_1, L8_1)
              end
            else
              L5_1 = L1_1
              L4_1 = L1_1.find
              L6_1 = "tasks\\microsoft\\windows\\pla"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if L4_1 then
                L4_1 = mp
                L4_1 = L4_1.CLEAN
                return L4_1
              else
                L5_1 = L1_1
                L4_1 = L1_1.find
                L6_1 = ":\\programdata\\"
                L7_1 = 1
                L8_1 = true
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if L4_1 then
                  L4_1 = mp
                  L4_1 = L4_1.CLEAN
                  return L4_1
                elseif L2_1 == "ngen.log" then
                  L4_1 = mp
                  L4_1 = L4_1.CLEAN
                  return L4_1
                else
                  L5_1 = L2_1
                  L4_1 = L2_1.find
                  L6_1 = "wsddfac.sys:x5zn8agxs4"
                  L7_1 = 1
                  L8_1 = true
                  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                  if L4_1 then
                    L4_1 = mp
                    L4_1 = L4_1.CLEAN
                    return L4_1
                  else
                    L5_1 = L2_1
                    L4_1 = L2_1.find
                    L6_1 = ":6e53bff5-0001-412b-8407-e3aede763511"
                    L7_1 = 1
                    L8_1 = true
                    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                    if L4_1 then
                      L4_1 = mp
                      L4_1 = L4_1.CLEAN
                      return L4_1
                    else
                      L5_1 = L2_1
                      L4_1 = L2_1.find
                      L6_1 = ":4c8cc155-6c1e-11d1-8e41-00c04fb9386d"
                      L7_1 = 1
                      L8_1 = true
                      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                      if L4_1 then
                        L4_1 = mp
                        L4_1 = L4_1.CLEAN
                        return L4_1
                      else
                        L5_1 = L2_1
                        L4_1 = L2_1.find
                        L6_1 = ":59828bbb-3f72-4c1b-a420-b51ad66eb5d3"
                        L7_1 = 1
                        L8_1 = true
                        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                        if L4_1 then
                          L4_1 = mp
                          L4_1 = L4_1.CLEAN
                          return L4_1
                        else
                          L5_1 = L2_1
                          L4_1 = L2_1.find
                          L6_1 = "%.blg:.+;summaryinformation"
                          L4_1 = L4_1(L5_1, L6_1)
                          if L4_1 then
                            L4_1 = mp
                            L4_1 = L4_1.CLEAN
                            return L4_1
                          elseif L0_1 == "dropbox.exe" then
                            L5_1 = L2_1
                            L4_1 = L2_1.find
                            L6_1 = ":com.dropbox."
                            L4_1 = L4_1(L5_1, L6_1)
                            if L4_1 then
                              L4_1 = mp
                              L4_1 = L4_1.CLEAN
                              return L4_1
                            end
                          elseif L0_1 == "codemeter.exe" then
                            L5_1 = L2_1
                            L4_1 = L2_1.find
                            L6_1 = ":cm_"
                            L7_1 = 1
                            L8_1 = true
                            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                            if L4_1 then
                              L4_1 = mp
                              L4_1 = L4_1.CLEAN
                              return L4_1
                            end
                          elseif L0_1 == "gamecenter.exe" then
                            L5_1 = L2_1
                            L4_1 = L2_1.find
                            L6_1 = ":gcdigest0"
                            L7_1 = 1
                            L8_1 = true
                            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                            if L4_1 then
                              L4_1 = mp
                              L4_1 = L4_1.CLEAN
                              return L4_1
                            end
                          elseif L0_1 == "launchpad.exe" then
                            L5_1 = L2_1
                            L4_1 = L2_1.find
                            L6_1 = ":crc"
                            L7_1 = 1
                            L8_1 = true
                            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                            if L4_1 then
                              L4_1 = mp
                              L4_1 = L4_1.CLEAN
                              return L4_1
                            end
                          elseif L0_1 == "avp.exe" then
                            L5_1 = L2_1
                            L4_1 = L2_1.find
                            L6_1 = ":k[eia][sv]extended"
                            L4_1 = L4_1(L5_1, L6_1)
                            if L4_1 then
                              L4_1 = mp
                              L4_1 = L4_1.CLEAN
                              return L4_1
                            end
                          elseif L0_1 == "wlmail.exe" then
                            L5_1 = L2_1
                            L4_1 = L2_1.find
                            L6_1 = ":oestandardproperty"
                            L7_1 = 1
                            L8_1 = true
                            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                            if L4_1 then
                              L4_1 = mp
                              L4_1 = L4_1.CLEAN
                              return L4_1
                            end
                          elseif L0_1 == "defendpointservice.exe" then
                            L5_1 = L2_1
                            L4_1 = L2_1.find
                            L6_1 = ":pg$secure"
                            L7_1 = 1
                            L8_1 = true
                            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                            if L4_1 then
                              L4_1 = mp
                              L4_1 = L4_1.CLEAN
                              return L4_1
                            end
                          else
                            L5_1 = L2_1
                            L4_1 = L2_1.find
                            L6_1 = ":logts"
                            L7_1 = 1
                            L8_1 = true
                            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                            if not L4_1 then
                              L5_1 = L2_1
                              L4_1 = L2_1.find
                              L6_1 = ":aidfilter"
                              L7_1 = 1
                              L8_1 = true
                              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                              if not L4_1 then
                                goto lbl_338
                              end
                            end
                            L4_1 = {}
                            L4_1["xaggregator.exe"] = true
                            L4_1["xtableserver.exe"] = true
                            L4_1["azurebatchscheduler.exe"] = true
                            L4_1["csm.exe"] = true
                            L4_1["storagelogagent.exe"] = true
                            L4_1["startcosmos.exe"] = true
                            L4_1["xgossip.exe"] = true
                            L4_1["nephosfile.exe"] = true
                            L4_1["storagediagnostics.exe"] = true
                            L4_1["poolserver.exe"] = true
                            L4_1["wij.exe"] = true
                            L4_1["xsmbserver.exe"] = true
                            L4_1["xcomputeprocessscheduler.exe"] = true
                            L4_1["xcomputejobscheduler.exe"] = true
                            L4_1["xcachenode.exe"] = true
                            L4_1["xfenativehdfs.exe"] = true
                            L5_1 = L4_1[L0_1]
                            if L5_1 then
                              L5_1 = mp
                              L5_1 = L5_1.CLEAN
                              do return L5_1 end
                              goto lbl_383
                              ::lbl_338::
                              if L0_1 == "nutstoreclient.exe" then
                                L5_1 = L2_1
                                L4_1 = L2_1.find
                                L6_1 = "nssyncsc:nssyncfp"
                                L7_1 = 1
                                L8_1 = true
                                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                                if not L4_1 then
                                  L5_1 = L2_1
                                  L4_1 = L2_1.find
                                  L6_1 = ":nsorigdir"
                                  L7_1 = 1
                                  L8_1 = true
                                  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                                  if not L4_1 then
                                    L5_1 = L2_1
                                    L4_1 = L2_1.find
                                    L6_1 = ":nsph"
                                    L7_1 = 1
                                    L8_1 = true
                                    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                                  end
                                end
                                if L4_1 then
                                  L4_1 = mp
                                  L4_1 = L4_1.CLEAN
                                  return L4_1
                                end
                              elseif L0_1 == "smartbytenetworkservice.exe" then
                                L5_1 = L2_1
                                L4_1 = L2_1.find
                                L6_1 = "png:originalpath"
                                L7_1 = 1
                                L8_1 = true
                                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                                if L4_1 then
                                  L4_1 = mp
                                  L4_1 = L4_1.CLEAN
                                  return L4_1
                                end
                              elseif L0_1 == "mscorsvw.exe" then
                                L4_1 = mp
                                L4_1 = L4_1.CLEAN
                                return L4_1
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              ::lbl_383::
              L5_1 = L2_1
              L4_1 = L2_1.find
              L6_1 = ":favicon"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if L4_1 then
                L4_1 = mp
                L4_1 = L4_1.set_mpattribute
                L5_1 = "BM_FaviconAlternateDataStream"
                L4_1(L5_1)
              else
                L4_1 = mp
                L4_1 = L4_1.set_mpattribute
                L5_1 = "BM_NonPeFileInAlternateDataStream"
                L4_1(L5_1)
              end
              L4_1 = MpCommon
              L4_1 = L4_1.QueryPersistContext
              L5_1 = L3_1
              L6_1 = "FileWrite2AlternateDataStream"
              L4_1 = L4_1(L5_1, L6_1)
              if not L4_1 then
                L5_1 = MpCommon
                L5_1 = L5_1.AppendPersistContext
                L6_1 = L3_1
                L7_1 = "FileWrite2AlternateDataStream"
                L8_1 = 100
                L5_1(L6_1, L7_1, L8_1)
              end
            end
            L4_1 = mp
            L4_1 = L4_1.INFECTED
            return L4_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
