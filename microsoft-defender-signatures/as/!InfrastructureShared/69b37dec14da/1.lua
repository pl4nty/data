local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.lower
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  L0_1 = L0_1(L1_1)
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L0_1
  L4_1 = "\\\\"
  L5_1 = "\\"
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L0_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "\\\\"
  L5_1 = "\\"
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  if L0_1 == L1_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = bm
    L3_1 = L3_1.get_imagepath
    L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1()
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    if L2_1 then
      L3_1 = {}
      L3_1["powershell.exe"] = true
      L3_1["wscript.exe"] = true
      L3_1["cscript.exe"] = true
      L3_1["mshta.exe"] = true
      L3_1["cmd.exe"] = true
      L3_1["rundll32.exe"] = true
      L3_1["regsvr32.exe"] = true
      L3_1["msbuild.exe"] = true
      L3_1["vbcscompiler.exe"] = true
      L3_1["csc.exe"] = true
      L3_1["python.exe"] = true
      L3_1["pythonw.exe"] = true
      L3_1["winword.exe"] = true
      L3_1["excel.exe"] = true
      L3_1["powerpnt.exe"] = true
      L4_1 = string
      L4_1 = L4_1.match
      L5_1 = L2_1
      L6_1 = "\\([^\\]+)$"
      L4_1 = L4_1(L5_1, L6_1)
      L5_1 = L3_1[L4_1]
      if L5_1 then
        L5_1 = TrackCustomPersistContextNameByPPID
        L6_1 = "set"
        L7_1 = "bm"
        L8_1 = "MimikatzTrigger"
        L5_1(L6_1, L7_1, L8_1)
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L2_1
      L7_1 = "\\windows\\"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L2_1
        L7_1 = "\\program files"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L2_1
          L7_1 = "\\scanner\\"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L2_1
            L7_1 = "\\chrome"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L2_1
              L7_1 = "\\programfiles\\"
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if not L5_1 then
                goto lbl_122
              end
            end
          end
        end
      end
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      do return L5_1 end
      ::lbl_122::
      L5_1 = TrackCustomPersistContextNameByPPID
      L6_1 = "set"
      L7_1 = "bm"
      L8_1 = "MimikatzTrigger"
      L5_1(L6_1, L7_1, L8_1)
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
