local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L3_1 = L4_1.utf8p2
  end
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L4_1 = L4_1.utf8p2
      if L4_1 ~= "" then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[3]
        L3_1 = L4_1.utf8p2
      end
    end
  end
end
if L3_1 ~= nil then
  L4_1 = is_valid_ip
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "/bin/bash"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "/bin/zsh"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "/bin/sh"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L5_1 = L3_1
          L4_1 = L3_1.match
          L6_1 = "'(bash)'"
          L4_1 = L4_1(L5_1, L6_1)
          if not L4_1 then
            L5_1 = L3_1
            L4_1 = L3_1.match
            L6_1 = "\"(bash)\""
            L4_1 = L4_1(L5_1, L6_1)
            if not L4_1 then
              L5_1 = L3_1
              L4_1 = L3_1.match
              L6_1 = "'(sh)'"
              L4_1 = L4_1(L5_1, L6_1)
              if not L4_1 then
                L5_1 = L3_1
                L4_1 = L3_1.match
                L6_1 = "\"(sh)\""
                L4_1 = L4_1(L5_1, L6_1)
                if not L4_1 then
                  L5_1 = L3_1
                  L4_1 = L3_1.match
                  L6_1 = "'(zsh)'"
                  L4_1 = L4_1(L5_1, L6_1)
                  if not L4_1 then
                    L5_1 = L3_1
                    L4_1 = L3_1.match
                    L6_1 = "\"(zsh)\""
                    L4_1 = L4_1(L5_1, L6_1)
                    if not L4_1 then
                      L5_1 = L3_1
                      L4_1 = L3_1.find
                      L6_1 = "zsh -i"
                      L7_1 = 1
                      L8_1 = true
                      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                      if not L4_1 then
                        L5_1 = L3_1
                        L4_1 = L3_1.find
                        L6_1 = "bash -i"
                        L7_1 = 1
                        L8_1 = true
                        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                        if not L4_1 then
                          L5_1 = L3_1
                          L4_1 = L3_1.find
                          L6_1 = "sh -i"
                          L7_1 = 1
                          L8_1 = true
                          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                          if not L4_1 then
                            goto lbl_164
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
    L4_1 = bm
    L4_1 = L4_1.trigger_sig
    L5_1 = "GenericReverseShell"
    L6_1 = L0_1
    L4_1(L5_1, L6_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
::lbl_164::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
