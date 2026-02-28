local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = peattributes
L0_1 = L0_1.isdamaged
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.no_security
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
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
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_PROCESS_ID
    L0_1 = L0_1(L1_1)
    if L0_1 == 4 then
      L1_1 = nil
      L2_1 = nil
      L3_1 = MpCommon
      L3_1 = L3_1.GetPersistContextCountNoPath
      L4_1 = "RDPSettings"
      L3_1 = L3_1(L4_1)
      if 0 < L3_1 then
        L3_1 = MpCommon
        L3_1 = L3_1.GetPersistContextNoPath
        L4_1 = "RDPSettings"
        L3_1 = L3_1(L4_1)
        L4_1 = ipairs
        L5_1 = L3_1
        L4_1, L5_1, L6_1 = L4_1(L5_1)
        for L7_1, L8_1 in L4_1, L5_1, L6_1 do
          L9_1 = string
          L9_1 = L9_1.match
          L10_1 = L8_1
          L11_1 = "UA=([%d]+);SL=([%d]+)"
          L9_1, L10_1 = L9_1(L10_1, L11_1)
          L2_1 = L10_1
          L1_1 = L9_1
          if L1_1 ~= nil then
            L9_1 = tonumber
            L10_1 = L1_1
            L9_1 = L9_1(L10_1)
            L1_1 = L9_1
            L9_1 = tonumber
            L10_1 = L2_1
            L9_1 = L9_1(L10_1)
            L2_1 = L9_1
            break
          end
        end
      else
        L3_1 = sysio
        L3_1 = L3_1.RegOpenKey
        L4_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\Terminal Services"
        L3_1 = L3_1(L4_1)
        L4_1 = nil
        if L3_1 then
          L5_1 = sysio
          L5_1 = L5_1.GetRegValueAsDword
          L6_1 = L3_1
          L7_1 = "UserAuthentication"
          L5_1 = L5_1(L6_1, L7_1)
          L1_1 = L5_1
          if L1_1 == nil then
            L5_1 = sysio
            L5_1 = L5_1.RegOpenKey
            L6_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp"
            L5_1 = L5_1(L6_1)
            L4_1 = L5_1
            if L4_1 then
              L5_1 = sysio
              L5_1 = L5_1.GetRegValueAsDword
              L6_1 = L4_1
              L7_1 = "UserAuthentication"
              L5_1 = L5_1(L6_1, L7_1)
              L1_1 = L5_1
            end
          end
          L5_1 = sysio
          L5_1 = L5_1.GetRegValueAsDword
          L6_1 = L3_1
          L7_1 = "SecurityLayer"
          L5_1 = L5_1(L6_1, L7_1)
          L2_1 = L5_1
          if L2_1 == nil then
            if L4_1 == nil then
              L5_1 = sysio
              L5_1 = L5_1.RegOpenKey
              L6_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp"
              L5_1 = L5_1(L6_1)
              L4_1 = L5_1
            end
            if L4_1 then
              L5_1 = sysio
              L5_1 = L5_1.GetRegValueAsDword
              L6_1 = L4_1
              L7_1 = "SecurityLayer"
              L5_1 = L5_1(L6_1, L7_1)
              L2_1 = L5_1
            end
          end
        end
        L5_1 = {}
        L5_1.UserAuthentication = L1_1
        L6_1 = "UA="
        L7_1 = L1_1
        L8_1 = ";SL="
        L9_1 = L2_1
        L6_1 = L6_1 .. L7_1 .. L8_1 .. L9_1
        L7_1 = table
        L7_1 = L7_1.insert
        L8_1 = L5_1
        L9_1 = L6_1
        L7_1(L8_1, L9_1)
        L7_1 = MpCommon
        L7_1 = L7_1.SetPersistContextNoPath
        L8_1 = "RDPSettings"
        L9_1 = L5_1
        L10_1 = 3600
        L7_1(L8_1, L9_1, L10_1)
      end
      if L1_1 == 1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      elseif L2_1 == 0 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = mp
      L3_1 = L3_1.IsTrustedFile
      L4_1 = false
      L3_1 = L3_1(L4_1)
      if L3_1 == true then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = mp
      L3_1 = L3_1.get_contextdata
      L4_1 = mp
      L4_1 = L4_1.CONTEXT_DATA_FILEPATH
      L3_1 = L3_1(L4_1)
      if L3_1 ~= nil then
        L4_1 = MpCommon
        L4_1 = L4_1.PathToWin32Path
        L5_1 = L3_1
        L4_1 = L4_1(L5_1)
        if L4_1 == nil then
          L5_1 = mp
          L5_1 = L5_1.CLEAN
          return L5_1
        end
        L5_1 = {}
        L5_1[":\\windows\\softwaredistribution"] = 1
        L5_1[":\\windows\\assembly\\nativeimage"] = 1
        L5_1[":\\program files\\cisco\\amp\\tmp\\"] = 1
        L5_1[":\\windows\\carbonblack\\store\\tm"] = 1
        L5_1[":\\program files (x86)\\trend mi"] = 1
        L5_1[":\\program files\\trend\\sprotect"] = 1
        L5_1[":\\$windows.~bt\\newos\\windows\\w"] = 1
        L5_1[":\\windows\\winsxs\\temp\\inflight"] = 1
        L5_1[":\\build_drop\\3ebuilddrop\\build"] = 1
        L5_1[":\\windows\\csc\\v2.0.6\\namespace"] = 1
        L5_1[":\\program files (x86)\\bmw\\ispi"] = 1
        L5_1[":\\program files\\sourcefire\\fir"] = 1
        L5_1[":\\programdata\\origin\\selfupdat"] = 1
        L5_1[":\\program files\\microsoft dyna"] = 1
        L5_1[":\\program files\\matlab\\r2019a\\"] = 1
        L6_1 = #L4_1
        if 30 < L6_1 then
          L6_1 = string
          L6_1 = L6_1.sub
          L7_1 = L4_1
          L8_1 = 2
          L9_1 = 31
          L6_1 = L6_1(L7_1, L8_1, L9_1)
          L7_1 = L6_1
          L6_1 = L6_1.lower
          L6_1 = L6_1(L7_1)
          L7_1 = L5_1[L6_1]
          if not L7_1 then
            L7_1 = string
            L7_1 = L7_1.find
            L8_1 = L6_1
            L9_1 = "\\$windows.~bt\\"
            L10_1 = 1
            L11_1 = true
            L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
            if not L7_1 then
              goto lbl_221
            end
          end
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          return L7_1
        end
        ::lbl_221::
        L6_1 = MpCommon
        L6_1 = L6_1.QueryPersistContext
        L7_1 = L3_1
        L8_1 = "SystemDrop"
        L6_1 = L6_1(L7_1, L8_1)
        if not L6_1 then
          L6_1 = MpCommon
          L6_1 = L6_1.AppendPersistContext
          L7_1 = L3_1
          L8_1 = "SystemDrop"
          L9_1 = 600
          L6_1(L7_1, L8_1, L9_1)
        end
      end
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
