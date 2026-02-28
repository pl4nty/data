local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = mp
    L2_1 = L2_1.get_contextdata
    L3_1 = mp
    L3_1 = L3_1.CONTEXT_DATA_FILEPATH
    L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
    if L1_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "/node_modules/"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "ionic-icon"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 == nil then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "ionicio"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 == nil then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L1_1
            L4_1 = "icon-package"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if L2_1 == nil then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L1_1
              L4_1 = "ajax-libs"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if L2_1 == nil then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L1_1
                L4_1 = "umbrellaks"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if L2_1 == nil then
                  L2_1 = string
                  L2_1 = L2_1.find
                  L3_1 = L1_1
                  L4_1 = "ajax-library"
                  L5_1 = 1
                  L6_1 = true
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if L2_1 == nil then
                    L2_1 = string
                    L2_1 = L2_1.find
                    L3_1 = L1_1
                    L4_1 = "iconion-package"
                    L5_1 = 1
                    L6_1 = true
                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                    if L2_1 == nil then
                      L2_1 = string
                      L2_1 = L2_1.find
                      L3_1 = L1_1
                      L4_1 = "package-sidr"
                      L5_1 = 1
                      L6_1 = true
                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                      if L2_1 == nil then
                        L2_1 = string
                        L2_1 = L2_1.find
                        L3_1 = L1_1
                        L4_1 = "kbrstore"
                        L5_1 = 1
                        L6_1 = true
                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                        if L2_1 == nil then
                          L2_1 = string
                          L2_1 = L2_1.find
                          L3_1 = L1_1
                          L4_1 = "icons-package"
                          L5_1 = 1
                          L6_1 = true
                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                          if L2_1 == nil then
                            L2_1 = string
                            L2_1 = L2_1.find
                            L3_1 = L1_1
                            L4_1 = "subek"
                            L5_1 = 1
                            L6_1 = true
                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                            if L2_1 == nil then
                              L2_1 = string
                              L2_1 = L2_1.find
                              L3_1 = L1_1
                              L4_1 = "package-show"
                              L5_1 = 1
                              L6_1 = true
                              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                              if L2_1 == nil then
                                L2_1 = string
                                L2_1 = L2_1.find
                                L3_1 = L1_1
                                L4_1 = "package-icon"
                                L5_1 = 1
                                L6_1 = true
                                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                if L2_1 == nil then
                                  L2_1 = string
                                  L2_1 = L2_1.find
                                  L3_1 = L1_1
                                  L4_1 = "icons-packages"
                                  L5_1 = 1
                                  L6_1 = true
                                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                  if L2_1 == nil then
                                    L2_1 = string
                                    L2_1 = L2_1.find
                                    L3_1 = L1_1
                                    L4_1 = "ionicon-package"
                                    L5_1 = 1
                                    L6_1 = true
                                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                    if L2_1 == nil then
                                      L2_1 = string
                                      L2_1 = L2_1.find
                                      L3_1 = L1_1
                                      L4_1 = "icons-pack"
                                      L5_1 = 1
                                      L6_1 = true
                                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                      if L2_1 == nil then
                                        L2_1 = string
                                        L2_1 = L2_1.find
                                        L3_1 = L1_1
                                        L4_1 = "pack-icons"
                                        L5_1 = 1
                                        L6_1 = true
                                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                        if L2_1 == nil then
                                          L2_1 = string
                                          L2_1 = L2_1.find
                                          L3_1 = L1_1
                                          L4_1 = "ionicons-pack"
                                          L5_1 = 1
                                          L6_1 = true
                                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                          if L2_1 == nil then
                                            L2_1 = string
                                            L2_1 = L2_1.find
                                            L3_1 = L1_1
                                            L4_1 = "package-ionicons"
                                            L5_1 = 1
                                            L6_1 = true
                                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                            if L2_1 == nil then
                                              L2_1 = string
                                              L2_1 = L2_1.find
                                              L3_1 = L1_1
                                              L4_1 = "footericon"
                                              L5_1 = 1
                                              L6_1 = true
                                              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                              if L2_1 == nil then
                                                L2_1 = string
                                                L2_1 = L2_1.find
                                                L3_1 = L1_1
                                                L4_1 = "swiper-bundle"
                                                L5_1 = 1
                                                L6_1 = true
                                                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                                if L2_1 == nil then
                                                  L2_1 = string
                                                  L2_1 = L2_1.find
                                                  L3_1 = L1_1
                                                  L4_1 = "atezzz"
                                                  L5_1 = 1
                                                  L6_1 = true
                                                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                                  if L2_1 == nil then
                                                    L2_1 = string
                                                    L2_1 = L2_1.find
                                                    L3_1 = L1_1
                                                    L4_1 = "small-sm"
                                                    L5_1 = 1
                                                    L6_1 = true
                                                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                                    if L2_1 == nil then
                                                      L2_1 = string
                                                      L2_1 = L2_1.find
                                                      L3_1 = L1_1
                                                      L4_1 = "pern-valids"
                                                      L5_1 = 1
                                                      L6_1 = true
                                                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                                      if L2_1 == nil then
                                                        L2_1 = string
                                                        L2_1 = L2_1.find
                                                        L3_1 = L1_1
                                                        L4_1 = "lifeculer"
                                                        L5_1 = 1
                                                        L6_1 = true
                                                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                                        if L2_1 == nil then
                                                          L2_1 = string
                                                          L2_1 = L2_1.find
                                                          L3_1 = L1_1
                                                          L4_1 = "proc-title"
                                                          L5_1 = 1
                                                          L6_1 = true
                                                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                                          if L2_1 == nil then
                                                            L2_1 = string
                                                            L2_1 = L2_1.find
                                                            L3_1 = L1_1
                                                            L4_1 = "libz.jquery"
                                                            L5_1 = 1
                                                            L6_1 = true
                                                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                                            if L2_1 == nil then
                                                              goto lbl_277
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
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
::lbl_277::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
