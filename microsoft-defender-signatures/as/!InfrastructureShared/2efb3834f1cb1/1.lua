local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.command_line
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_33
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_33::
L3_1 = extract_urls
L4_1 = L2_1
L3_1, L4_1 = L3_1(L4_1)
L5_1 = false
if L3_1 ~= nil or L4_1 ~= nil then
  L6_1 = #L3_1
  if not (0 < L6_1) then
    L6_1 = #L4_1
    if not (0 < L6_1) then
      goto lbl_48
    end
  end
  L5_1 = true
end
::lbl_48::
if L5_1 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L2_1
  L8_1 = "/bin/bash"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L2_1
    L8_1 = "/bin/zsh"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L2_1
      L8_1 = "/bin/sh"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L7_1 = L2_1
        L6_1 = L2_1.match
        L8_1 = "'(bash)'"
        L6_1 = L6_1(L7_1, L8_1)
        if not L6_1 then
          L7_1 = L2_1
          L6_1 = L2_1.match
          L8_1 = "\"(bash)\""
          L6_1 = L6_1(L7_1, L8_1)
          if not L6_1 then
            L7_1 = L2_1
            L6_1 = L2_1.match
            L8_1 = "'(sh)'"
            L6_1 = L6_1(L7_1, L8_1)
            if not L6_1 then
              L7_1 = L2_1
              L6_1 = L2_1.match
              L8_1 = "\"(sh)\""
              L6_1 = L6_1(L7_1, L8_1)
              if not L6_1 then
                L7_1 = L2_1
                L6_1 = L2_1.match
                L8_1 = "'(zsh)'"
                L6_1 = L6_1(L7_1, L8_1)
                if not L6_1 then
                  L7_1 = L2_1
                  L6_1 = L2_1.match
                  L8_1 = "\"(zsh)\""
                  L6_1 = L6_1(L7_1, L8_1)
                  if not L6_1 then
                    L7_1 = L2_1
                    L6_1 = L2_1.find
                    L8_1 = " bash "
                    L9_1 = 1
                    L10_1 = true
                    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                    if not L6_1 then
                      L7_1 = L2_1
                      L6_1 = L2_1.find
                      L8_1 = " sh "
                      L9_1 = 1
                      L10_1 = true
                      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                      if not L6_1 then
                        L7_1 = L2_1
                        L6_1 = L2_1.find
                        L8_1 = " zsh "
                        L9_1 = 1
                        L10_1 = true
                        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                        if not L6_1 then
                          L7_1 = L2_1
                          L6_1 = L2_1.find
                          L8_1 = "zsh -i"
                          L9_1 = 1
                          L10_1 = true
                          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                          if not L6_1 then
                            L7_1 = L2_1
                            L6_1 = L2_1.find
                            L8_1 = "bash -i"
                            L9_1 = 1
                            L10_1 = true
                            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                            if not L6_1 then
                              L7_1 = L2_1
                              L6_1 = L2_1.find
                              L8_1 = "sh -i"
                              L9_1 = 1
                              L10_1 = true
                              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                              if not L6_1 then
                                L7_1 = L2_1
                                L6_1 = L2_1.find
                                L8_1 = "do%s+%$"
                                L9_1 = 1
                                L10_1 = false
                                L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                                if not L6_1 then
                                  goto lbl_159
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
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
::lbl_159::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
