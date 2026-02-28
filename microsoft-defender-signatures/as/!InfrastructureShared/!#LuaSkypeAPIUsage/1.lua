local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 11534336 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONOPEN
if L1_1 ~= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L1_1 ~= L2_1 then
    goto lbl_185
  end
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILEPATH
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILENAME
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
if L3_1 ~= "mpc-hc.exe" and L3_1 ~= "skytel.exe" and L3_1 ~= "clownfish.exe" and L3_1 ~= "csrskype.exe" and L3_1 ~= "livesupport.exe" and L3_1 ~= "mpl.exe" and L3_1 ~= "pamela.exe" and L3_1 ~= "mpc-hc_nvo.exe" and L3_1 ~= "livesupport_setup.exe" and L3_1 ~= "ezgamexn.dll" and L3_1 ~= "skype4com.dll" and L3_1 ~= "livesupport_setup.exe" then
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L3_1
  L6_1 = -4
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= ".wim" then
    L4_1 = string
    L4_1 = L4_1.sub
    L5_1 = L3_1
    L6_1 = -4
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= ".iso" then
      L4_1 = string
      L4_1 = L4_1.sub
      L5_1 = L3_1
      L6_1 = -4
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 ~= ".cab" then
        goto lbl_89
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_89::
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = "program files"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = "hp"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L2_1
    L6_1 = "acer"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L2_1
      L6_1 = "compaq"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 == nil then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L2_1
        L6_1 = "broadcom"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 == nil then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L2_1
          L6_1 = "isos"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if L4_1 == nil then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L2_1
            L6_1 = "realtek"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if L4_1 == nil then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L2_1
              L6_1 = "lenovo"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if L4_1 == nil then
                L4_1 = string
                L4_1 = L4_1.find
                L5_1 = L2_1
                L6_1 = "bluetooth"
                L7_1 = 1
                L8_1 = true
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if L4_1 == nil then
                  L4_1 = string
                  L4_1 = L4_1.find
                  L5_1 = L2_1
                  L6_1 = "driver"
                  L7_1 = 1
                  L8_1 = true
                  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                  if L4_1 == nil then
                    goto lbl_182
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
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_182::
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_185::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
