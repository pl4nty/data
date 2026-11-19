-- Threat: !InfrastructureShared
-- Name: Filcout
-- Type: 15

local l_0_0 = sysio.RegOpenKey("HKCR\\*\\shell\\filescout")
if l_0_0 ~= nil then
  sysio.DeleteRegKey(l_0_0, nil)
end
local l_0_1 = sysio.RegOpenKey("HKCR\\*\\shell\\unknownfile")
if l_0_1 ~= nil then
  sysio.DeleteRegKey(l_0_1, nil)
end
local l_0_2 = sysio.RegOpenKey("HKCR\\Unknown\\shell\\openas\\command")
if l_0_2 ~= nil then
  local l_0_3 = sysio.GetRegValueAsString(l_0_2, nil)
  if l_0_3 ~= nil and (string.find(string.lower(l_0_3), "filescout.exe") or string.find(string.lower(l_0_3), "unknownfile.exe")) then
    if Info.OSMajorVersion == 6 then
      if Info.OSMinorVersion >= 2 and Info.OSMinorVersion <= 3 then
        sysio.SetRegValueAsStringExpand(l_0_2, nil, "%SystemRoot%\\system32\\OpenWith.exe \"%1\"")
      end
    else
      sysio.SetRegValueAsStringExpand(l_0_2, nil, "%SystemRoot%\\system32\\rundll32.exe %SystemRoot%\\system32\\shell32.dll,OpenAs_RunDLL %1")
    end
  end
  local l_0_4 = sysio.GetRegValueAsString(l_0_2, "fs_DelegateExecute")
  if l_0_4 ~= nil and l_0_4 == "{e44e9428-bdbc-4987-a099-40dc8fd255e7}" then
    sysio.SetRegValueAsString(l_0_2, "DelegateExecute", "{e44e9428-bdbc-4987-a099-40dc8fd255e7}")
  end
end
