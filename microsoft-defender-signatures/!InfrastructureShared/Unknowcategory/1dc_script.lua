-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\1dc_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = (string.gsub)(l_0_1, "\"", "")
  l_0_1 = (string.gsub)(l_0_1, "\'", "")
  l_0_1 = (string.lower)(l_0_1)
  if (string.find)(l_0_1, "taskkill", 1, true) or (string.find)(l_0_1, "user32.dll", 1, true) or (string.find)(l_0_1, "dsquery", 1, true) or (string.find)(l_0_1, "iplocation", 1, true) or (string.find)(l_0_1, "rockwell", 1, true) or (string.find)(l_0_1, "chrome", 1, true) or (string.find)(l_0_1, "vbscripts", 1, true) or (string.find)(l_0_1, "parrot", 1, true) or (string.find)(l_0_1, "inet-ip", 1, true) or (string.find)(l_0_1, "powrprof.dll", 1, true) or (string.find)(l_0_1, " \\\\", 1, true) or (string.find)(l_0_1, "\\intune", 1, true) or (string.find)(l_0_1, "recyclebin", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC363: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC363: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC363: Unhandled construct in 'MakeBoolean' P3

  if (string.find)(l_0_1, "curl", 1, true) or (((string.find)(l_0_1, "iex", 1, true) and not (string.find)(l_0_1, "iexp", 1, true) and not (string.find)(l_0_1, "iexe", 1, true)) or not (string.find)(l_0_1, "bitsadmin", 1, true) or not (string.find)(l_0_1, ".msi", 1, true) or not (string.find)(l_0_1, " -e ", 1, true) or not (string.find)(l_0_1, " -encodedcommand ", 1, true) or (string.find)(l_0_1, "powershell", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN

