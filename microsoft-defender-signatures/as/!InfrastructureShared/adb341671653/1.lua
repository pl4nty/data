local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= "" then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[4]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= nil then
      L0_1 = bm
      L0_1 = L0_1.get_current_process_startup_info
      L0_1 = L0_1()
      L1_1 = L0_1.command_line
      L2_1 = bm
      L2_1 = L2_1.get_imagepath
      L2_1 = L2_1()
      L3_1 = IsExcludedByCmdlineMacOS
      L4_1 = L1_1
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = IsExcludedByImagePathMacOS
        L4_1 = L2_1
        L3_1 = L3_1(L4_1)
        if not L3_1 then
          goto lbl_36
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_36::
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "ODIS/AdODIS-installer.app/Contents/MacOS"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "Frameworks/Squirrel.framework/Versions/A/Resources/ShipIt"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "GoogleUpdater.app/Contents/MacOS/GoogleUpdater"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L2_1
            L3_1 = L2_1.find
            L5_1 = "/Applications/Logos.app/Contents/MacOS/Logos"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L4_1 = L2_1
              L3_1 = L2_1.find
              L5_1 = "/Applications/Proclaim.app/Contents/MacOS/Proclaim"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                L4_1 = L1_1
                L3_1 = L1_1.find
                L5_1 = "/Applications/Connect to Network.app"
                L6_1 = 1
                L7_1 = true
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if not L3_1 then
                  L4_1 = L2_1
                  L3_1 = L2_1.find
                  L5_1 = "Logos.app.bundle/Contents/MacOS/Logos"
                  L6_1 = 1
                  L7_1 = true
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                  if not L3_1 then
                    L4_1 = L2_1
                    L3_1 = L2_1.find
                    L5_1 = "/Library/PrivilegedHelperTools/fr.whitebox.packages/packages_builder"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if not L3_1 then
                      L4_1 = L1_1
                      L3_1 = L1_1.find
                      L5_1 = "Utilities/SWR/ZBrush Installer/Maxon ZBrush"
                      L6_1 = 1
                      L7_1 = true
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      if not L3_1 then
                        L4_1 = L1_1
                        L3_1 = L1_1.find
                        L5_1 = "sudo-prompt-applet.zip"
                        L6_1 = 1
                        L7_1 = true
                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                        if not L3_1 then
                          L4_1 = L2_1
                          L3_1 = L2_1.find
                          L5_1 = "/Applications/Visual Studio Code"
                          L6_1 = 1
                          L7_1 = true
                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                          if not L3_1 then
                            goto lbl_116
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
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_116::
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p2
      L4_1 = SuspMacPathsToMonitor
      L5_1 = L3_1
      L6_1 = true
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "/Users/[^/]+/Downloads/"
        L7_1 = 1
        L8_1 = false
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = "/Users/[^/]+/Documents/"
          L7_1 = 1
          L8_1 = false
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = "/Users/[^/]+/Desktop/"
            L7_1 = 1
            L8_1 = false
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              goto lbl_155
            end
          end
        end
      end
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
::lbl_155::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
