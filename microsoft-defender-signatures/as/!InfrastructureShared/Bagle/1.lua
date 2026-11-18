-- Threat: !InfrastructureShared
-- Name: Bagle
-- Type: 15

if string.match(Remediation.Threat.Name, "Bagle") then
  local l_0_0 = Remediation.Threat.Name
  
  local function l_0_1(l_1_0, l_1_1)
    local l_1_2 = sysio.RegOpenKey(l_1_0)
    if l_1_2 then
      sysio.DeleteRegKey(l_1_2, l_1_1)
    end
  end
  
  local function l_0_2(l_2_0, l_2_1)
    local l_2_2 = sysio.RegExpandUserKey(l_2_0)
    if l_2_2 then
      for l_2_3, l_2_4 in pairs(l_2_2) do
        l_0_1(l_2_4, l_2_1)
      end
    end
  end
  
  if string.match(l_0_0, "Win32/Bagle%.[AC]@mm") then
    l_0_2("HKCU\\Software", "Windows98")
  elseif l_0_0 == "Win32/Bagle.B@mm" then
    l_0_2("HKCU\\Software", "Windows2000")
  elseif l_0_0 == "Win32/Bagle.C@mm" then
    l_0_2("HKCU\\Software", "DateTime2")
  elseif l_0_0 == "Win32/Bagle.D@mm" then
    l_0_2("HKCU\\Software", "DateTime3")
  elseif l_0_0 == "Win32/Bagle.E@mm" then
    l_0_2("HKCU\\Software", "DateTime4")
  elseif l_0_0 == "Win32/Bagle.F@mm" then
    l_0_2("HKCU\\Software", "winword")
  elseif l_0_0 == "Win32/Bagle.H@mm" then
    l_0_2("HKCU\\Software", "winexe")
  elseif l_0_0 == "Win32/Bagle.I@mm" then
    l_0_2("HKCU\\Software", "windor")
  elseif string.match(l_0_0, "Win32/Bagle%.J@mm") or string.match(l_0_0, "Win32/Bagle%.K@mm") or string.match(l_0_0, "Win32/Bagle%.L@mm") or string.match(l_0_0, "Win32/Bagle%.M@mm") or string.match(l_0_0, "Win32/Bagle%.O") or string.match(l_0_0, "Win32/Bagle%.W@mm") or string.match(l_0_0, "Win32/Bagle%.AA@mm") then
    l_0_2("HKCU\\Software", "DateTime")
  elseif string.match(l_0_0, "Win32/Bagle%.O@mm") or string.match(l_0_0, "Win32/Bagle%.P@mm") then
    l_0_2("HKCU\\Software", "winupd")
  elseif l_0_0 == "Win32/Bagle.Q@mm" then
    l_0_2("HKCU\\Software", "windirects")
  elseif l_0_0 == "Win32/Bagle.S@mm" then
    l_0_2("HKCU\\Software", "windirect")
  elseif string.match(l_0_0, "Win32/Bagle%.T@mm") or string.match(l_0_0, "Win32/Bagle%.AI") then
    l_0_2("HKCU\\Software", "windirects")
    l_0_2("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion", "Ru1n")
    l_0_1("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion", "Ru1n")
  elseif l_0_0 == "Win32/Bagle.U@mm" then
    l_0_2("HKCU\\Software", "Windows2004")
  elseif l_0_0 == "Win32/Bagle.V@mm" then
    l_0_2("HKCU\\Software", "Windows2005")
    l_0_2("HKCU\\Software", "DateTime")
  elseif l_0_0 == "Win32/Bagle.AJ@mm" then
    l_0_2("HKCU\\Software", "DateTime8")
  elseif string.match(l_0_0, "Win32/Bagle%.AN@mm") or string.match(l_0_0, "Win32/Bagle%.AQ@mm") or string.match(l_0_0, "Win32/Bagle%.AR@mm") or string.match(l_0_0, "Win32/Bagle%.AT@mm") or string.match(l_0_0, "Win32/Bagle%.AW@mm") then
    l_0_2("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion", "Ru1n")
    l_0_1("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion", "Ru1n")
  end
  if string.match(l_0_0, "Bagle%.[F-Z]") or string.match(l_0_0, "Bagle%.[A-Z][A-Z]+@mm") then
    Remediation.SetRemovalPolicy(crypto.bitor(Remediation.Threat.RemovalPolicy, 4))
  end
end
