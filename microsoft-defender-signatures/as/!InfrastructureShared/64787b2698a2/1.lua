-- Threat: !InfrastructureShared
-- Name: 64787b2698a2
-- Type: 21

local l_0_0 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].RVA
if l_0_0 == 0 then
  return mp.LOWFI
end
if l_0_0 + 4096 > mp.getfilesize() then
  return mp.LOWFI
end
mp.readprotection(false)
local l_0_1 = mp.readfile(l_0_0 + 3904, 27)
if l_0_1 == "\004\b\019\002OR1\0180\016\006\003U\004\a\019\tBeaverton1" then
  return mp.INFECTED
end
l_0_1 = mp.readfile(l_0_0 + 3876, 27)
if l_0_1 == "\004\b\019\002OR1\0180\016\006\003U\004\a\019\tBeaverton1" then
  return mp.INFECTED
end
l_0_1 = mp.readfile(l_0_0 + 3602, 27)
if l_0_1 == "\004\b\019\002OR1\0180\016\006\003U\004\a\019\tBeaverton1" then
  return mp.INFECTED
end
return mp.LOWFI
