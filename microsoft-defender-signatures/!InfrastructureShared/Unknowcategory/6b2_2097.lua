-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6b2_2097.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 then
  if (string.find)(l_0_0, "\\application\\msedge.exe", 1, true) or (string.find)(l_0_0, "\\application\\chrome.exe", 1, true) or (string.find)(l_0_0, "\\application\\360se.exe", 1, true) or (string.find)(l_0_0, "\\application\\brave.exe", 1, true) or (string.find)(l_0_0, "\\application\\360chromex.exe", 1, true) or (string.find)(l_0_0, "\\desktop\\", 1, true) or (string.find)(l_0_0, "\\program files\\windowsapps\\", 1, true) or (string.find)(l_0_0, "\\local\\programs\\opera", 1, true) or (string.find)(l_0_0, "\\local\\programs\\quark\\quark.exe", 1, true) or (string.find)(l_0_0, "\\netchp.exe", 1, true) or (string.find)(l_0_0, "\\application\\browser.exe", 1, true) or (string.find)(l_0_0, "\\mpsigstub.exe", 1, true) then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, "\\users\\public\\", 1, true) or (string.find)(l_0_0, "\\appdata\\roaming\\", 1, true) or (string.find)(l_0_0, "\\appdata\\local\\temp\\", 1, true) or (string.find)(l_0_0, "\\windows\\temp\\", 1, true) or (string.find)(l_0_0, "\\python", 1, true) then
    return mp.INFECTED
  end
end
local l_0_1 = (bm.get_current_process_startup_info)()
local l_0_2 = l_0_1.command_line
if l_0_2 then
  l_0_2 = (string.gsub)(l_0_2, "\"", "")
  l_0_2 = (string.gsub)(l_0_2, "\'", "")
  l_0_2 = (string.lower)(l_0_2)
  -- DECOMPILER ERROR at PC311: Unhandled construct in 'MakeBoolean' P3

  if (string.find)(l_0_2, "curl", 1, true) or (((string.find)(l_0_2, "mshta", 1, true) and (string.find)(l_0_2, "http", 1, true)) or not (string.find)(l_0_2, "msiexec", 1, true) or not (string.find)(l_0_2, "powershell", 1, true) or (string.find)(l_0_2, "iex", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN

