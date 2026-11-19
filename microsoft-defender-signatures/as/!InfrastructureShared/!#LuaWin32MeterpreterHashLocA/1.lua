-- Threat: !InfrastructureShared
-- Name: !#Lua:Win32/MeterpreterHashLoc.A
-- Type: 10
-- MpAttributes: HSTR:Metasploit.Trampoline.A & pea_isexe

if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if mp.getfilesize() < 2048 or mp.getfilesize() > 20480 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pesecs[3].PointerToRawData, 32)
if l_0_0:match("^%x+$") then
  local l_0_1, l_0_2 = string.gsub(l_0_0, "%x", "")
  if l_0_2 == 32 then
    return mp.INFECTED
  end
end
return mp.CLEAN
