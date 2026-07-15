-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Mydoom\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = (sysio.RegOpenKey)(l_1_0)
  if l_1_2 then
    (sysio.DeleteRegKey)(l_1_2, l_1_1)
  end
end

local l_0_1 = function(l_2_0, l_2_1)
  -- function num : 0_1
  local l_2_2 = (sysio.RegOpenKey)(l_2_0)
  if l_2_2 then
    (sysio.DeleteRegValue)(l_2_2, l_2_1)
  end
end

local l_0_2 = function(l_3_0, l_3_1, l_3_2)
  -- function num : 0_2
  local l_3_3 = (sysio.RegOpenKey)(l_3_0)
  if l_3_3 then
    (sysio.SetRegValueAsString)(l_3_3, l_3_1, l_3_2)
  end
end

if (string.match)((Remediation.Threat).Name, "Mydoom") then
  l_0_0("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ComDlg32", "Version")
  l_0_0("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer", "ComDlg32")
  l_0_0("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion", "Shell")
  l_0_1("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\User Agent", "Version")
  l_0_1("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\5.0\\User Agent", "Version")
  l_0_0("HKLM\\Software\\Microsoft", "Daemon")
  l_0_0("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer", "Mshdfg")
  l_0_0("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer", "ShellSmash")
  ;
  (function(l_4_0, l_4_1)
  -- function num : 0_3 , upvalues : l_0_0
  local l_4_2 = (sysio.RegExpandUserKey)(l_4_0)
  if l_4_2 then
    for l_4_6,l_4_7 in pairs(l_4_2) do
      l_0_0(l_4_7, l_4_1)
    end
  end
end
)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ComDlg32", "Version")
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (function(l_4_0, l_4_1)
  -- function num : 0_3 , upvalues : l_0_0
  local l_4_2 = (sysio.RegExpandUserKey)(l_4_0)
  if l_4_2 then
    for l_4_6,l_4_7 in pairs(l_4_2) do
      l_0_0(l_4_7, l_4_1)
    end
  end
end
)("HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\User Agent", "Version")
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (function(l_4_0, l_4_1)
  -- function num : 0_3 , upvalues : l_0_0
  local l_4_2 = (sysio.RegExpandUserKey)(l_4_0)
  if l_4_2 then
    for l_4_6,l_4_7 in pairs(l_4_2) do
      l_0_0(l_4_7, l_4_1)
    end
  end
end
)("HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\5.0\\User Agent", "Version")
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (function(l_4_0, l_4_1)
  -- function num : 0_3 , upvalues : l_0_0
  local l_4_2 = (sysio.RegExpandUserKey)(l_4_0)
  if l_4_2 then
    for l_4_6,l_4_7 in pairs(l_4_2) do
      l_0_0(l_4_7, l_4_1)
    end
  end
end
)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion", "Shell")
  -- DECOMPILER ERROR at PC64: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (function(l_4_0, l_4_1)
  -- function num : 0_3 , upvalues : l_0_0
  local l_4_2 = (sysio.RegExpandUserKey)(l_4_0)
  if l_4_2 then
    for l_4_6,l_4_7 in pairs(l_4_2) do
      l_0_0(l_4_7, l_4_1)
    end
  end
end
)("HKCU\\SOFTWARE\\Microsoft\\Internet Explorer", "FuckedInst")
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (function(l_4_0, l_4_1)
  -- function num : 0_3 , upvalues : l_0_0
  local l_4_2 = (sysio.RegExpandUserKey)(l_4_0)
  if l_4_2 then
    for l_4_6,l_4_7 in pairs(l_4_2) do
      l_0_0(l_4_7, l_4_1)
    end
  end
end
)("HKCU\\SOFTWARE\\Microsoft\\Internet Explorer", "InstaledFlashhMX")
  l_0_2("HKLM\\Software\\Classes\\CLSID\\{E6FB5E20-DE35-11CF-9C87-00AA005127ED}\\InProcServer32", "", "webcheck.dll")
  ;
  (function(l_5_0, l_5_1, l_5_2)
  -- function num : 0_4 , upvalues : l_0_2
  local l_5_3 = (sysio.RegExpandUserKey)(l_5_0)
  if l_5_3 then
    for l_5_7,l_5_8 in pairs(l_5_3) do
      l_0_2(l_5_8, l_5_1, l_5_2)
    end
  end
end
)("HKCU\\Software\\Classes\\CLSID\\{E6FB5E20-DE35-11CF-9C87-00AA005127ED}\\InProcServer32", "", "webcheck.dll")
  -- DECOMPILER ERROR at PC82: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (function(l_5_0, l_5_1, l_5_2)
  -- function num : 0_4 , upvalues : l_0_2
  local l_5_3 = (sysio.RegExpandUserKey)(l_5_0)
  if l_5_3 then
    for l_5_7,l_5_8 in pairs(l_5_3) do
      l_0_2(l_5_8, l_5_1, l_5_2)
    end
  end
end
)("HKCU\\Software\\Classes\\CLSID\\{35CEC8A3-2BE6-11D2-8773-92E220524153}\\InProcServer32", "", "stobject.dll")
  l_0_2("HKLM\\Software\\Classes\\CLSID\\{35CEC8A3-2BE6-11D2-8773-92E220524153}\\InProcServer32", "", "stobject.dll")
  -- DECOMPILER ERROR at PC92: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (function(l_5_0, l_5_1, l_5_2)
  -- function num : 0_4 , upvalues : l_0_2
  local l_5_3 = (sysio.RegExpandUserKey)(l_5_0)
  if l_5_3 then
    for l_5_7,l_5_8 in pairs(l_5_3) do
      l_0_2(l_5_8, l_5_1, l_5_2)
    end
  end
end
)("HKCU\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon", "Shell", "Explorer.exe")
  l_0_2("HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon", "Shell", "Explorer.exe")
  local l_0_5 = nil
  -- DECOMPILER ERROR at PC114: Confused about usage of register: R5 in 'UnsetPending'

  if (string.match)((Remediation.Threat).Name, "Mydoom%.[F-Z]") or (string.match)((Remediation.Threat).Name, "Mydoom%.[A-Z][A-Z]") then
    (Remediation.SetRemovalPolicy)((crypto.bitor)((Remediation.Threat).RemovalPolicy, 4))
  end
  -- DECOMPILER ERROR at PC131: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC138: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC145: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC152: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC159: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC166: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC173: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC180: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC187: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC194: Confused about usage of register: R5 in 'UnsetPending'

  if (string.match)((Remediation.Threat).Name, "Mydoom%.AA") or (string.match)((Remediation.Threat).Name, "Mydoom%.AB") or (string.match)((Remediation.Threat).Name, "Mydoom%.AC") or (string.match)((Remediation.Threat).Name, "Mydoom%.AD") or (string.match)((Remediation.Threat).Name, "Mydoom%.AE") or (string.match)((Remediation.Threat).Name, "Mydoom%.AF") or (string.match)((Remediation.Threat).Name, "Mydoom%.AG") or (string.match)((Remediation.Threat).Name, "Mydoom%.AL") or (string.match)((Remediation.Threat).Name, "Mydoom%.BH") or (string.match)((Remediation.Threat).Name, "Mydoom%.AW") then
    do
      Infrastructure_FixHostsFile()
      -- DECOMPILER ERROR at PC201: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

