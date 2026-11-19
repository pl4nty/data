-- Threat: \x8c!Sirefef.gen!C
-- Type: 9
-- MpAttributes: PEEMU:VirTool:Win32/Obfuscator_XQ_Sirefef

if pehdr.SizeOfImage >= 131072 then
  return mp.INFECTED
elseif pehdr.SizeOfImage >= 57344 then
  mp.changedetectionname(805306405)
  return mp.INFECTED
else
  mp.changedetectionname(805306406)
  return mp.SUSPICIOUS
end
return mp.CLEAN
