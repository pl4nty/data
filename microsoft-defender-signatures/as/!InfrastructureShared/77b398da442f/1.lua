local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if 15 <= L1_1 then
    L1_1 = {}
    L1_1["services.exe"] = true
    L1_1["msmpeng.exe"] = true
    L1_1["trustedinstaller.exe"] = true
    L1_1["tiworker.exe"] = true
    L1_1["poqexec.exe"] = true
    L1_1["svchost.exe"] = true
    L1_1["mbamservice.exe"] = true
    L1_1["core.exe"] = true
    L1_1["instup.exe"] = true
    L1_1["tguard.exe"] = true
    L1_1["nortonsecurity.exe"] = true
    L1_1["mfehidin.exe"] = true
    L1_1["mfeamcin.exe"] = true
    L1_1["avp.exe"] = true
    L1_1["v3medic.exe"] = true
    L1_1["vpninstaller.exe"] = true
    L1_1["waappagent.exe"] = true
    L1_1["handle64.exe"] = true
    L1_1["procexp64.exe"] = true
    L1_1["qhactivedefense.exe"] = true
    L1_1["qhsafetray.exe"] = true
    L1_1["computerztray.exe"] = true
    L1_1["avira.servicehost.exe"] = true
    L1_1["zhudongfangyu.exe"] = true
    L1_1["360tray.exe"] = true
    L1_1["qqpctray.exe"] = true
    L1_1["qqpcrtp.exe"] = true
    L1_1["kxecore.exe"] = true
    L1_1["kxetray.exe"] = true
    L1_1["fabrichost.exe"] = true
    L3_1 = L0_1
    L2_1 = L0_1.match
    L4_1 = "\\([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
      L3_1 = L1_1[L2_1]
      if L3_1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
    end
  end
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  end
end
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "\\windowsazure\\.-\\waappagent.exe"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
else
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "\\windowsazure.-\\windowsazurenetagent.exe"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  else
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "system32\\drivers\\mbamswissarmy.sys"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    else
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "symantec shared\\eengine\\eraserutildrv11821.sys"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      else
        L3_1 = L1_1
        L2_1 = L1_1.find
        L4_1 = "system32\\drivers\\kbasemgr.sys"
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 then
          L2_1 = mp
          L2_1 = L2_1.CLEAN
          return L2_1
        else
          L3_1 = L1_1
          L2_1 = L1_1.find
          L4_1 = "system32\\drivers\\kbasesrv.sys"
          L2_1 = L2_1(L3_1, L4_1)
          if L2_1 then
            L2_1 = mp
            L2_1 = L2_1.CLEAN
            return L2_1
          else
            L3_1 = L1_1
            L2_1 = L1_1.find
            L4_1 = "system32\\drivers\\kisknl.sys"
            L2_1 = L2_1(L3_1, L4_1)
            if L2_1 then
              L2_1 = mp
              L2_1 = L2_1.CLEAN
              return L2_1
            else
              L3_1 = L1_1
              L2_1 = L1_1.find
              L4_1 = "system32\\drivers\\kavbootc64_ev.sys"
              L2_1 = L2_1(L3_1, L4_1)
              if L2_1 then
                L2_1 = mp
                L2_1 = L2_1.CLEAN
                return L2_1
              end
            end
          end
        end
      end
    end
  end
end
if L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.GetExecutablesFromCommandLine
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = mp
    L8_1 = L8_1.ContextualExpandEnvironmentVariables
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    L7_1 = L8_1
    L8_1 = sysio
    L8_1 = L8_1.IsFileExists
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = bm
      L8_1 = L8_1.add_related_file
      L9_1 = L7_1
      L8_1(L9_1)
    end
  end
end
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1543.003"
L5_1 = "service_reg_modified_b"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
