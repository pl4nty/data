local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = string
    L8_1 = L8_1.match
    L9_1 = L6_1.image_path
    L10_1 = "\\([^\\]+)$"
    L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L8_1(L9_1, L10_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
    if L7_1 == "services.exe" then
      L8_1 = nil
      L9_1 = bm
      L9_1 = L9_1.get_current_process_startup_info
      L9_1 = L9_1()
      if L9_1 ~= nil then
        L10_1 = L9_1.ppid
        if L10_1 ~= nil then
          L8_1 = L9_1.ppid
        end
      end
      L10_1 = bm
      L10_1 = L10_1.get_imagepath
      L10_1 = L10_1()
      if L10_1 ~= nil then
        L11_1 = MpCommon
        L11_1 = L11_1.PathToWin32Path
        L12_1 = L10_1
        L11_1 = L11_1(L12_1)
        L10_1 = L11_1
      end
      if L10_1 == nil or L8_1 == nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L11_1 = string
      L11_1 = L11_1.lower
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      L10_1 = L11_1
      L11_1 = StringStartsWith
      L12_1 = L10_1
      L13_1 = "%"
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L12_1 = L10_1
      L11_1 = L10_1.find
      L13_1 = "\\adminarsenal\\"
      L14_1 = 1
      L15_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if not L11_1 then
        L12_1 = L10_1
        L11_1 = L10_1.find
        L13_1 = "ccmexec%.exe"
        L11_1 = L11_1(L12_1, L13_1)
        if not L11_1 then
          L12_1 = L10_1
          L11_1 = L10_1.find
          L13_1 = "bomgar%-scc%.exe"
          L11_1 = L11_1(L12_1, L13_1)
          if not L11_1 then
            L12_1 = L10_1
            L11_1 = L10_1.find
            L13_1 = "keyacc32%.exe"
            L11_1 = L11_1(L12_1, L13_1)
            if not L11_1 then
              goto lbl_92
            end
          end
        end
      end
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      do return L11_1 end
      ::lbl_92::
      L12_1 = L10_1
      L11_1 = L10_1.find
      L13_1 = "\\temp\\kav remote installations\\"
      L14_1 = 1
      L15_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if not L11_1 then
        L12_1 = L10_1
        L11_1 = L10_1.find
        L13_1 = "\\logmein rescue connectonlan\\lmirescueapplet"
        L14_1 = 1
        L15_1 = true
        L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
        if not L11_1 then
          goto lbl_109
        end
      end
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      do return L11_1 end
      ::lbl_109::
      L12_1 = L10_1
      L11_1 = L10_1.find
      L13_1 = "\\veeam.+%.exe"
      L11_1 = L11_1(L12_1, L13_1)
      if not L11_1 then
        L12_1 = L10_1
        L11_1 = L10_1.find
        L13_1 = "\\f5.+%.exe"
        L11_1 = L11_1(L12_1, L13_1)
        if not L11_1 then
          goto lbl_122
        end
      end
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      do return L11_1 end
      ::lbl_122::
      L12_1 = L10_1
      L11_1 = L10_1.find
      L13_1 = "\\pdq.+%.exe"
      L11_1 = L11_1(L12_1, L13_1)
      if L11_1 then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L11_1 = IsPidExcluded
      L12_1 = L8_1
      L11_1 = L11_1(L12_1)
      if L11_1 then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      L11_1 = TrackPidAndTechniqueBM
      L12_1 = L8_1
      L13_1 = "T1021.002"
      L14_1 = "remoteservice-target"
      L11_1(L12_1, L13_1, L14_1)
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      return L11_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
