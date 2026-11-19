-- Threat: !InfrastructureShared
-- Name: !#TEL:HackTool:Win32/Mimikatz.B!dll
-- Type: 8

if not peattributes.isdll then
  return mp.CLEAN
end
if peattributes.no_exports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 == 1 then
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 ~= nil and string.len(l_0_2) >= 9 and string.find(string.lower(l_0_2), "_mimikatz", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
