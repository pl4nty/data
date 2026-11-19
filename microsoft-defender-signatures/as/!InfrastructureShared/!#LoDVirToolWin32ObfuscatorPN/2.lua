-- Threat: !InfrastructureShared
-- Name: !#LoD:VirTool:Win32/Obfuscator.PN
-- Type: 8

if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 11 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(640, 6)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 6)
if l_0_1 ~= 3246015244 then
  return mp.CLEAN
end
return mp.INFECTED
