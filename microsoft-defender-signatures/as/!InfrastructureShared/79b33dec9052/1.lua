-- Threat: !InfrastructureShared
-- Name: 79b33dec9052
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = string.gsub(l_0_1, "\"", "")
  l_0_1 = string.gsub(l_0_1, "'", "")
  l_0_1 = string.gsub(l_0_1, "'+'", "")
  l_0_1 = string.gsub(l_0_1, "\"+\"", "")
  local l_0_2 = string.lower(l_0_1)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if contains(l_0_2, {
    "-bxor",
    "bitsadmin.exe /transfer",
    "::writeallbytes;$",
    "net.webclient",
    "new-object -comobject shell.application).nameSpace",
    "hidden iex",
    "');invoke-webRequest -uri",
    "hidden invoke-expression",
    ".replace( $((pwd)",
    "iex ([system.text.encoding]::UTF8.getstring([convert]::frombase64string",
    "              #",
    "iex(irm ",
    "-leaf)); iwr $",
    "[windows.forms.messagebox]::show([string]::concat",
    "join($env:temp"
  }) then
    return mp.INFECTED
  end
end
return mp.CLEAN
