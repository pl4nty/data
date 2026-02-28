local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "/tmp/docker-desktop-privileged"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "therealtomrose/citrix-workspace-killer/master/stop_citrix.sh"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "githubusercontent.com/docker/scout-cli/main/install"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "https://cdn.appcatalog.cloud/install_app_catalog.zsh"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "raw.githubusercontent.com/johnduprey/CWCAutomateDiagnostics/master/AutomateDiagnostics"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "/Volumes/Volume/scripts/.*/download.sh$"
          L6_1 = 1
          L7_1 = false
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L2_1
            L3_1 = L2_1.find
            L5_1 = "raw.githubusercontent.com/CLA-Tech/ARD/master/enableARD.sh"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L4_1 = L2_1
              L3_1 = L2_1.find
              L5_1 = "raw.githubusercontent.com/nvm-sh/nvm/"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                L4_1 = L2_1
                L3_1 = L2_1.find
                L5_1 = "raw.githubusercontent.com/golangci/golangci-lint/[^/]+/install.sh"
                L6_1 = 1
                L7_1 = false
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if not L3_1 then
                  L4_1 = L2_1
                  L3_1 = L2_1.find
                  L5_1 = "/Users/[^/]+/.claude/shell-snapshots"
                  L6_1 = 1
                  L7_1 = false
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                  if not L3_1 then
                    L4_1 = L2_1
                    L3_1 = L2_1.find
                    L5_1 = "echo -n 636F6E666967202D740A"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if not L3_1 then
                      L4_1 = L2_1
                      L3_1 = L2_1.find
                      L5_1 = ".ssh/auth/client_private.pem"
                      L6_1 = 1
                      L7_1 = true
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      if not L3_1 then
                        L4_1 = L2_1
                        L3_1 = L2_1.find
                        L5_1 = "zjsms.com"
                        L6_1 = 1
                        L7_1 = true
                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                        if not L3_1 then
                          L4_1 = L2_1
                          L3_1 = L2_1.find
                          L5_1 = "/Volumes/.*/manifest.json$"
                          L6_1 = 1
                          L7_1 = false
                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                          if not L3_1 then
                            L4_1 = L2_1
                            L3_1 = L2_1.find
                            L5_1 = "hass-agent/releases/latest/download/install.sh"
                            L6_1 = 1
                            L7_1 = true
                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                            if not L3_1 then
                              L4_1 = L2_1
                              L3_1 = L2_1.find
                              L5_1 = "ios.bytedance.net/wlapi"
                              L6_1 = 1
                              L7_1 = true
                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                              if not L3_1 then
                                L4_1 = L2_1
                                L3_1 = L2_1.find
                                L5_1 = "/Library/Caches/CocoaPods/.*/Pods/Release"
                                L6_1 = 1
                                L7_1 = false
                                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                if not L3_1 then
                                  L4_1 = L2_1
                                  L3_1 = L2_1.find
                                  L5_1 = ".claude/shell-snapshots/snapshot-zsh"
                                  L6_1 = 1
                                  L7_1 = true
                                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                  if not L3_1 then
                                    L4_1 = L2_1
                                    L3_1 = L2_1.find
                                    L5_1 = "https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh"
                                    L6_1 = 1
                                    L7_1 = true
                                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                    if not L3_1 then
                                      L4_1 = L2_1
                                      L3_1 = L2_1.find
                                      L5_1 = "https://claude.ai/install.sh"
                                      L6_1 = 1
                                      L7_1 = true
                                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                      if not L3_1 then
                                        L4_1 = L2_1
                                        L3_1 = L2_1.find
                                        L5_1 = "https://bun.sh/install"
                                        L6_1 = 1
                                        L7_1 = true
                                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                        if not L3_1 then
                                          L4_1 = L2_1
                                          L3_1 = L2_1.find
                                          L5_1 = "export CLOUDIDE_API_SERVER_BASE_URL=https://ide.byted.org"
                                          L6_1 = 1
                                          L7_1 = true
                                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                          if not L3_1 then
                                            L4_1 = L2_1
                                            L3_1 = L2_1.find
                                            L5_1 = ".sdkman/bin/sdkman-init.sh"
                                            L6_1 = 1
                                            L7_1 = true
                                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                            if not L3_1 then
                                              L4_1 = L2_1
                                              L3_1 = L2_1.find
                                              L5_1 = "https://get.sdkman.io"
                                              L6_1 = 1
                                              L7_1 = true
                                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                              if not L3_1 then
                                                L4_1 = L2_1
                                                L3_1 = L2_1.find
                                                L5_1 = "https://astral.sh/uv/install.sh"
                                                L6_1 = 1
                                                L7_1 = false
                                                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                if not L3_1 then
                                                  L4_1 = L2_1
                                                  L3_1 = L2_1.find
                                                  L5_1 = "zsh -c RACK_NAME="
                                                  L6_1 = 1
                                                  L7_1 = true
                                                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                  if not L3_1 then
                                                    L4_1 = L2_1
                                                    L3_1 = L2_1.find
                                                    L5_1 = "echo ZWNobyAneyJJcEFkZHJlc3MiOiBb"
                                                    L6_1 = 1
                                                    L7_1 = true
                                                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                    if not L3_1 then
                                                      L4_1 = L2_1
                                                      L3_1 = L2_1.find
                                                      L5_1 = "configuration-delivery/podinstall_remote_hook.sh"
                                                      L6_1 = 1
                                                      L7_1 = true
                                                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                      if not L3_1 then
                                                        L4_1 = L2_1
                                                        L3_1 = L2_1.find
                                                        L5_1 = "plutil -extract NSPServiceStatusManagerInfo"
                                                        L6_1 = 1
                                                        L7_1 = true
                                                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                        if not L3_1 then
                                                          L4_1 = L2_1
                                                          L3_1 = L2_1.find
                                                          L5_1 = "https://is.snssdk.com/service"
                                                          L6_1 = 1
                                                          L7_1 = true
                                                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                          if not L3_1 then
                                                            L4_1 = L2_1
                                                            L3_1 = L2_1.find
                                                            L5_1 = ".byted.org"
                                                            L6_1 = 1
                                                            L7_1 = true
                                                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                            if not L3_1 then
                                                              L4_1 = L2_1
                                                              L3_1 = L2_1.find
                                                              L5_1 = "/opt/homebrew/bin/openssl%s+pkeyutl.*%.ssh/auth/client_private%.pem"
                                                              L6_1 = 1
                                                              L7_1 = false
                                                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                              if not L3_1 then
                                                                goto lbl_260
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
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_260::
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "echo.*%|%s+base64%s+-d"
L6_1 = 1
L7_1 = false
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "echo.*%|%s+base64%s+--decode"
  L6_1 = 1
  L7_1 = false
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "echo.*%|%s+base64%s+-D"
    L6_1 = 1
    L7_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "echo.*%|%s+bash"
      L6_1 = 1
      L7_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "echo.*%|%s+sh"
        L6_1 = 1
        L7_1 = false
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "echo.*%|%s+zsh"
          L6_1 = 1
          L7_1 = false
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L2_1
            L3_1 = L2_1.find
            L5_1 = "curl.*%|%s+bash"
            L6_1 = 1
            L7_1 = false
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L4_1 = L2_1
              L3_1 = L2_1.find
              L5_1 = "curl.*%|%s+sh"
              L6_1 = 1
              L7_1 = false
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                L4_1 = L2_1
                L3_1 = L2_1.find
                L5_1 = "curl.*%|%s+zsh"
                L6_1 = 1
                L7_1 = false
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if not L3_1 then
                  L4_1 = L2_1
                  L3_1 = L2_1.find
                  L5_1 = "curl.*%|%s+osascript"
                  L6_1 = 1
                  L7_1 = false
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                  if not L3_1 then
                    L4_1 = L2_1
                    L3_1 = L2_1.find
                    L5_1 = "tail%s+-c.*%|%s+funzip"
                    L6_1 = 1
                    L7_1 = false
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if not L3_1 then
                      L4_1 = L2_1
                      L3_1 = L2_1.find
                      L5_1 = "echo.*%|%s+xxd"
                      L6_1 = 1
                      L7_1 = false
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      if not L3_1 then
                        goto lbl_347
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
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_347::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
