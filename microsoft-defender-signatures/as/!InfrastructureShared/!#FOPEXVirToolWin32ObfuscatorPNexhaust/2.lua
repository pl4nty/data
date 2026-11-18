-- Threat: !InfrastructureShared
-- Name: !#FOPEX:VirTool:Win32/Obfuscator.PN.exhaust
-- Type: 8

if pevars.epsec == 1 and pehdr.NumberOfSections == 3 and mp.readu_u32(headerpage, 769) == 1702061426 then
  return mp.INFECTED
end
return mp.CLEAN
